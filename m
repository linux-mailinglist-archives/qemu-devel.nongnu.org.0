Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE444279FBB
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Sep 2020 10:43:30 +0200 (CEST)
Received: from localhost ([::1]:44450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMSHJ-0006fV-Vy
	for lists+qemu-devel@lfdr.de; Sun, 27 Sep 2020 04:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kMSGM-000640-FY
 for qemu-devel@nongnu.org; Sun, 27 Sep 2020 04:42:31 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kMSGK-0007fL-V3
 for qemu-devel@nongnu.org; Sun, 27 Sep 2020 04:42:30 -0400
Received: by mail-wr1-x443.google.com with SMTP id z4so8378651wrr.4
 for <qemu-devel@nongnu.org>; Sun, 27 Sep 2020 01:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qkUMGT7n0WZ/SW7El1TZgYq0aK/fTxuQj2aDx1DOQOo=;
 b=dtpcW8uQK5VNnyeTTy+UPof8FNlmT+WQG65UfhludWltsW7Z4kNC/vCBkvGKEnnJw+
 BKa8YrVb7KxvNzDhkFDW1DxwFcWdPu+zG1XtFWCjfhzfIJX+F/iv3M184H9BzWCnT0oh
 u4T+8qgGRuuQGGxXzJEs/XCVOnLmJA1ZaspaqrciC6r4EF2pGVl3WQV/gG5u2wmR6TQZ
 ZyCe0mxSwkBoLW8UMZ2ZHlQGiy27d2scIWdhIv1J2LLTAQhmTQjhs5kxI54mtjcYkMn2
 vi4by8JxoUBahjVTAPRGOrAAJyGdFL4NBEyyCThuun/wAuzgtAMLxmRC5gbgjv8P6S5z
 YyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qkUMGT7n0WZ/SW7El1TZgYq0aK/fTxuQj2aDx1DOQOo=;
 b=n7nG9Ujsy38Ilo0TI0LyQGapi/kqZfSvfvk/uodX8C/8C2UP+QkUyGbyPTc1hbgq/h
 4+6Yj3gg/h80PQOSTljLtUJpo1WBQkTnSjpokdhKsOsnb09K/Atyd6/PHJH1ZiyLrPNt
 I4kBKQQUYGXlUkcXfkWzPjruYVG/ruV4TR2Pcxpxf9bQbl8/cSPxsWY4Arg85XypEluV
 iU4BfeTOooYHBdNM4u/JV4pgEg44gzsuoz4Y59I1oipzFu4E+IemAWsXvxFMj1CMnr4d
 KxilOyaTmclcaBJyBJpw/uqLeoijvvrP1HCKxtHL6XngBSv0kNkXa04qkT6d7Q+hMzlJ
 nHsA==
X-Gm-Message-State: AOAM533NFEq8p7V05BUwwV8oPLxk6Zvl/jRR4B0rn2SEMUmalOOn3tj6
 tO1/CgUbjEYqrJHaGRW8DpkXXfVIVgM=
X-Google-Smtp-Source: ABdhPJzWvNgS1zohseWLzeTiC0m8rZsABCxnxdg0NN1p4TRxxVvZU0fg0VLPgy3hyrxUfG1F/L0qmg==
X-Received: by 2002:a5d:4a48:: with SMTP id v8mr13087468wrs.304.1601196146575; 
 Sun, 27 Sep 2020 01:42:26 -0700 (PDT)
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id a17sm9621804wra.24.2020.09.27.01.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Sep 2020 01:42:25 -0700 (PDT)
Subject: Re: [PATCH 2/4] plugin: Fixes compiling errors on msys2/mingw
To: Richard Henderson <richard.henderson@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
References: <20200926140415.1286-1-luoyonggang@gmail.com>
 <20200926140415.1286-3-luoyonggang@gmail.com>
 <b6e76dcf-187c-4e49-a82c-ed0b637d07b1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <347ca968-f1e5-20bb-2608-c531d3eb6b45@amsat.org>
Date: Sun, 27 Sep 2020 10:42:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b6e76dcf-187c-4e49-a82c-ed0b637d07b1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.213,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/20 5:18 AM, Richard Henderson wrote:
> On 9/26/20 7:04 AM, Yonggang Luo wrote:
>> @@ -72,7 +72,7 @@ static void vcpu_tb_exec(unsigned int cpu_index, void *udata)
>>      CPUCount *count = max_cpus ?
>>          g_ptr_array_index(counts, cpu_index) : &inline_count;
>>  
>> -    unsigned long n_insns = (unsigned long)udata;
>> +    uint64_t n_insns = (uint64_t)udata;
> 
> This needs to be uintptr_t.

Oops good catch.

> 
> r~
> 


