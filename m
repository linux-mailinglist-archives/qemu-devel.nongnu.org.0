Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AABA44673B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:45:24 +0100 (CET)
Received: from localhost ([::1]:37024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2LC-0002gb-Pw
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mj2Jh-0000qD-4R
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:43:50 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:42243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mj2Jf-0004sn-34
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:43:48 -0400
Received: from [192.168.100.1] ([82.142.14.190]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MF45G-1myRZX3fdw-00FV1a; Fri, 05 Nov 2021 17:43:44 +0100
Message-ID: <d1782549-ed0c-356d-15f8-57ed25555c1f@vivier.eu>
Date: Fri, 5 Nov 2021 17:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 09/13] macfb: add common monitor modes supported by the
 MacOS toolbox ROM
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211008114518.757615-1-laurent@vivier.eu>
 <20211008114518.757615-10-laurent@vivier.eu>
 <CAFEAcA_nLL5Op2wDanPr=8j2SyVBQQkV=Ke93uzybs76GDRCmw@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAFEAcA_nLL5Op2wDanPr=8j2SyVBQQkV=Ke93uzybs76GDRCmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aXXNBUAVtGhjmGijwfZgcsiZdtMxIj1KsEj3KwXs44t2tcHHZXS
 XudMYsrHCz0NjEPpITy0l65auxjJsRvxljTF90vzXce90sWesebDnxgiWQ83feJc3sswAbx
 yzvgaL0jpfrjHjgR5AtBezSGMVkEugwUFekiic6CcOq7FAeCkqauncWpiSlkLLlFTdFotSZ
 xlhrnhCigw+Xo/1cKVQsQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/zrK24nIUiA=:4BPw8BVU/xeaUGTeIUbkSM
 eqAPM7NlaJcrxrNpFfLho5Spq+9xvY5PeAyYWgmIfDBvGchzSTzBFTFyXhxmEg8I9VvVauRug
 uhOFxONeQdOXNwhcNIjX6D9MbGWxU1wtnVKVcY/wt2boFi6xV0zSInUXdbmxfJX9DQa+Scpnx
 p22rQJcL2IaA5/0TjzheegwvM0UiFciwxzpkG3wL7Gv7Q1dU4LDoERZnczCznU5hL3i1D/GbF
 ZLQIBs1UqiOLsdROt9k8fu/SJLnBNP9TfjehBoPG6v2HI/MVURUKJdfiUYYVPYrXR9szO23Tq
 lnhCLgBRSAdR+uxbt+/Ez0qVXIMwHFT72Q2lE6Z6l2nWeDyZ6CMFA59H5q4ZZ3Ng8+CT9sGWX
 DQLh24JLbnSNnDDD+A6B2pi2A22TSQxgrVBDUV8N1dK4uetQJngvUrqi15nWfahJug8u900cv
 ZiQ+pb4iQ1efmCoq/VkUNxCMSQ/fJTtFFOhpaZi6O3TtwiOfr5wwHXcYqchfZ096Ca8ww04pj
 HTGr5FV092Hg+J8q8kfWJQykK7gxsZNHp1t4LuLC6maJJet+EPl05T6MFgSkyXPBsZjGZk05v
 OUmZDNapXUbvIzQYYBaYt9Gpn/+J5ihXqMJ85lIbLymmd65LUf4bwhqtnDk5stKuyBiM55pf/
 T4qc6Nd6ZZueJ/dksko7UT78UFEETmPzR/PrE7fxJXO/Ngs7v79GfN5lGR8qfFsK4T6I=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/11/2021 à 16:56, Peter Maydell a écrit :
> On Fri, 8 Oct 2021 at 12:57, Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>
>> The monitor modes table is found by experimenting with the Monitors Control
>> Panel in MacOS and analysing the reads/writes. From this it can be found that
>> the mode is controlled by writes to the DAFB_MODE_CTRL1 and DAFB_MODE_CTRL2
>> registers.
> 
> Hi; Coverity points out a memory leak here (CID 1465231):
> 
>> +static gchar *macfb_mode_list(void)
>> +{
>> +    gchar *list = NULL;
>> +    gchar *mode;
>> +    MacFbMode *macfb_mode;
>> +    int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(macfb_mode_table); i++) {
>> +        macfb_mode = &macfb_mode_table[i];
>> +
>> +        mode = g_strdup_printf("    %dx%dx%d\n", macfb_mode->width,
>> +                               macfb_mode->height, macfb_mode->depth);
>> +        list = g_strconcat(mode, list, NULL);
>> +        g_free(mode);
> 
> We pass the old value of 'list' to g_strconcat(), which allocates
> new memory and returns it; the 'list = ' overwrites the old 'list'
> value. So the old string is leaked, because g_strconcat() won't
> free it for you.
> 
> Coverity also complains that we pass NULL as argument 2 to
> g_strconcat() the first time through the loop and this is bad;
> I'm not sure whether it's wrong or not.
> 
> This function might be better written to use GString and
> g_string_append_printf() to add each line to the GString.
> 

I'm going to send a fix according to your comments.

Thanks,
Laurent


