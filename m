Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788F85E60C0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 13:18:46 +0200 (CEST)
Received: from localhost ([::1]:33596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obKE9-0007it-3T
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 07:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJpk-0003q0-In; Thu, 22 Sep 2022 06:53:32 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJpi-00051r-3x; Thu, 22 Sep 2022 06:53:32 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 s14-20020a17090a6e4e00b0020057c70943so1864144pjm.1; 
 Thu, 22 Sep 2022 03:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=OSjhEWVWG5cpE+zVyckzZBmNTARzCZxn+ZfYhI4GEoc=;
 b=YuVn9IYKhgz1viFM4GDE3pBx/M31SojUBsWdgf7yBU8dGS4nkZGXf9IUXdcmcfu1t3
 8esvzaVV2Ggzp8Kr31TAUQdYCaLz/AVKjIUljr+Ufg7pPfR5Llc1NKZRSd5yXlp86X5W
 NH2X2iuVONzi94I3GgXGQPvhJIwka+pOJgyLZE49nxak/OBVfqzeKgvHcy0mPwAG6eTq
 ooCS59rCsZadCzEjri8uII8PfVq02uSpPMtwT3TsKJjsTg678e9JWvOFNB3ZpN9RVYyf
 d/pE92KQahSi0I3I3v8FSilBe2JHlpR57fKK1ACea2H677outATqVJIACosk8/ejLhDq
 kAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=OSjhEWVWG5cpE+zVyckzZBmNTARzCZxn+ZfYhI4GEoc=;
 b=fhZW60L+wLxoi+6ZgU2UfBJZR5dndc5QTEg5Rz7NsCP5rflTcjZMOmGAdi1RD9MNTB
 Ue4vmSbQZUPyWGiLMFOARIToNQVPVF4Ls/gnwm5eGs7DgmluBeTtWmhQzeole9jYOcdg
 jZto9So2kjJ1w15mtZ/q31E40sUx8sd26dQX/N/jYfrmRjIcZhy4CUbBPMx769ros6kv
 f+R5aBpAnpDpZjdqzLiBecIttobqfCZSZJ+WrFdl9MjF+4e3loUAkwkETqhk1GUKXNpY
 1xsKRkLAzB/YwBBiu+/BemBaSuBiUQU6zx3M9JxjYkRfsTaLbOwotiphAUVTZ4aBP/Dk
 zUeg==
X-Gm-Message-State: ACrzQf1vAgY7gWw3e7FXfYDyUlqqhWljEe/xGYvWEMSwm0F8h98xW+Ui
 dbC1OF6BfI0D/cz4HQvtXow=
X-Google-Smtp-Source: AMsMyM7RNhCM7WSCrKnnJ3DRKBmealiGep8eubdfah5BrGp/x0qhkHoHAWU6jhxQi2E8geQAtYf/7Q==
X-Received: by 2002:a17:90b:1bc2:b0:200:a97b:4ae5 with SMTP id
 oa2-20020a17090b1bc200b00200a97b4ae5mr3130387pjb.147.1663844006791; 
 Thu, 22 Sep 2022 03:53:26 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o126-20020a62cd84000000b00537eacc8fa6sm4108613pfg.40.2022.09.22.03.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 03:53:26 -0700 (PDT)
Message-ID: <c2fe7f23-85e9-4fa8-ade4-6fdb175eb1a2@amsat.org>
Date: Thu, 22 Sep 2022 12:53:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v7 06/14] hw/ppc: set machine->fdt in
 sam460ex_load_device_tree()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220908194040.518400-1-danielhb413@gmail.com>
 <20220908194040.518400-7-danielhb413@gmail.com>
In-Reply-To: <20220908194040.518400-7-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.702,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 8/9/22 21:40, Daniel Henrique Barboza wrote:
> This will enable support for 'dumpdtb' QMP/HMP command for the sam460ex
> machine.
> 
> Setting machine->fdt requires a MachineState pointer to be used inside
> sam460ex_load_device_tree(). Let's change the function to receive this
> pointer from the caller. 'ramsize' and 'kernel_cmdline' can be retrieved
> directly from the 'machine' pointer.
> 
> Cc: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/ppc/sam460ex.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

