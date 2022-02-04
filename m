Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E0F4AA0C0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:03:02 +0100 (CET)
Received: from localhost ([::1]:40688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG4nN-0005QD-6w
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:03:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG4Ir-0001JO-4W
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 14:31:29 -0500
Received: from [2607:f8b0:4864:20::62e] (port=36357
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG4Ip-0003Ih-3e
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 14:31:28 -0500
Received: by mail-pl1-x62e.google.com with SMTP id x3so6012517pll.3
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 11:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5idSbIxBHxqL6h4/luJir/uZUJaXsZCZ53cQklyH3dA=;
 b=EAqr2Gfq3sc2JLRnSUbJvK8kBOMgTF3j7mbpcw9uvtdFAEelzRYKPTZm5OlIXmoxau
 tt8ON3QbZM0E5iEv71rl6luCFpL9sAMplMZuzG2cSWo3EnSDMGtypOzJowO98Mjkra+V
 ppl/IT96orqTN7ucZYSLotlxEnzLnp+u0dJ06AXDMR89sJDIsWgd3L+hN0TiHAasjPtO
 /vvpzYCPZGc1t75TbEtoPu6b8CASHJ7iCRVMJer54lGB0c+4ugV5KTpGhynfTxquaKnF
 cgMIN+DCrq54j33RtZlf3ZjK/K1rZyshu1RiVz5UizHDZtmeOARtPRNLtmvkA7PGe8zo
 +jpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5idSbIxBHxqL6h4/luJir/uZUJaXsZCZ53cQklyH3dA=;
 b=hjK1fDosxcMDS3iTy4lNJfpJZjC4RPOwPF3+FU6o/NiSEOomodlxSL/hQhPShfywhl
 ZmAINCFqMfthsdBSo05sizCLOU9SmkHrHnSMws3mFzLpI/HHU0oy9O6psuSMrg1rrLVj
 koR2ufPWgixlDSb6KcOHp+FiAdAg+yHbSECgTD7uk5POaraM1hDcik7v3w+zgnSubfrQ
 wdwhnpLJz/AqFMHPHz1Y6HL5jTqe/PyhPMycEldrTHAd3PCHXXnmpFnNT/biGPEZ3Ybs
 RPHdTh/5fmE9QVIGjEP5arIv9PvwIJtI6v/8zkJOqsjOXc2n0S0fravLtcT5/cCvOAq7
 r4Gg==
X-Gm-Message-State: AOAM530d7L6ugph+dlLITYaEoWJBg9LlMMfcCNjIg8A8RtOUFzdMcAIq
 5lxTMPtIDOr576MjYfLv1EQ=
X-Google-Smtp-Source: ABdhPJz8Y3P9ctCIOVH9+09/9+mVlpb06SJmL7/72pa6e3fn4sqNLQMFtbOuiGo+1qlIDlOjaHHf1Q==
X-Received: by 2002:a17:90a:d188:: with SMTP id
 fu8mr4828401pjb.60.1644003085701; 
 Fri, 04 Feb 2022 11:31:25 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id mj23sm2793719pjb.54.2022.02.04.11.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 11:31:25 -0800 (PST)
Message-ID: <7cd97d2e-30a6-3857-464e-f39ddd98a407@amsat.org>
Date: Fri, 4 Feb 2022 20:31:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3 1/2] hw/i386: Attach CPUs to machine
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Yang Zhong <yang.zhong@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220131233507.334174-1-f4bug@amsat.org>
 <20220131233507.334174-2-f4bug@amsat.org>
 <CABgObfY6+-GjEi9hfFs2x6CRctPHFBt3hxwRK_73tL8Hm4on5A@mail.gmail.com>
In-Reply-To: <CABgObfY6+-GjEi9hfFs2x6CRctPHFBt3hxwRK_73tL8Hm4on5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/2/22 18:59, Paolo Bonzini wrote:
> This is causing breakage in the acpi-tables-test, sorry.

$ make check-qtest-x86_64

Ok:                 49
Expected Fail:      0
Fail:               0
Unexpected Pass:    0
Skipped:            7
Timeout:            0

$ make check-qtest-i386

Ok:                 52
Expected Fail:      0
Fail:               0
Unexpected Pass:    0
Skipped:            4
Timeout:            0

I am confuse, how do you run it?

