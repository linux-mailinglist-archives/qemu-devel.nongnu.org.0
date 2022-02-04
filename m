Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168314AA10B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:17:00 +0100 (CET)
Received: from localhost ([::1]:58574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG50s-0001Az-2x
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:16:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG4JC-00025X-AI; Fri, 04 Feb 2022 14:31:50 -0500
Received: from [2607:f8b0:4864:20::1033] (port=44851
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG4J9-0003L8-JK; Fri, 04 Feb 2022 14:31:49 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 y5-20020a17090aca8500b001b8127e3d3aso7008814pjt.3; 
 Fri, 04 Feb 2022 11:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OS5/kgYKyZY8GoF8mnP+AEa4hVuol3XDlbw2YnI7xjY=;
 b=ocsJFp8u1j3bV3lCbBUcrIelBJiafYeEK0a6EAYm1rFmZz4wRG9ACO7il5cCuB96WW
 GZuPwymj1ND9pZGh53ev/K/Mb6ZstrFazDH5cYSv2F3VXv1+aH3TKJ6volucE4Dw83RY
 +VhX9VxBF1CHgeb8DW1qfyrnsCgkBghBCNv+9bTUTSPy5QbEIE6LudpEXHATcxWQiqsv
 8XJeoX3fsSWguI6dkupLAPpq76SpfpLoaVtq0Otk2wHGMPgwy01XdVwxnYTP8CPvNYoO
 JfQtJVqeQWylgxxd7U9S+f0TC1k2rTf0Ahn0Zr/mCbTsOTKJPZGpdZvevvkD22wcXFDn
 27sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OS5/kgYKyZY8GoF8mnP+AEa4hVuol3XDlbw2YnI7xjY=;
 b=PwVeYhnLgYy10b+tV2WavPN1lWms/nlfd6bX0E7A/MoamAAl8tXrAPkgqkYIVTn8Bq
 2207G9Vp1L14svtktjmwlUQpLpIXW8ZoEYzeZzQ9FYAlX3/5vZcwR8c7VHbdZpJWqa0N
 uBiseeco7v1KvM2SBIixmCCxTJYUVK5Bn0LCefYPrzYdEYmLg7SEW0lRVKD9pFUZkWG0
 s0zf8yVBORyyh+5WnHtdfTW/EvBe9aiR0lIk8tMFD6Y7zl/tynOEXd7KHHpYMCyxP10l
 VbzZY+jPnHFslR3YCKiTnZv2hWYML4Xfl/P6rHHEYHwM9/dhQkKeeNP2F+eDLAbQEPFL
 Xi6Q==
X-Gm-Message-State: AOAM531Q5yAPv/xxjwMhfjjmb/TRcsWy3KD0RTev2PibpD8mW/dhMmz7
 fHrprZRCD7dW7EV9aajso1li4hKPvh8=
X-Google-Smtp-Source: ABdhPJwsswKi58OMO9zB1uzpAIsCU0MUFlRmZEXK5xNx1PHQWbdIxprGDyuohKNPwL+sOTKKZuzARw==
X-Received: by 2002:a17:90b:3889:: with SMTP id
 mu9mr4851301pjb.207.1644003105807; 
 Fri, 04 Feb 2022 11:31:45 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id n2sm2261689pgf.74.2022.02.04.11.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 11:31:45 -0800 (PST)
Message-ID: <12419d2c-25dd-1f00-2d67-9edcf64e1340@amsat.org>
Date: Fri, 4 Feb 2022 20:31:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: "Dmitry V. Levin" <ldv@altlinux.org>, Vitaly Chikunov <vt@altlinux.org>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, qemu-stable@nongnu.org
References: <20220204050609.15510-1-vt@altlinux.org>
 <20220204155059.GA18407@altlinux.org>
 <5c9d8b95-30ec-0801-ab26-51f40958b357@amsat.org> <3780614.DPuHsZYPev@silver>
In-Reply-To: <3780614.DPuHsZYPev@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
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

On 4/2/22 17:04, Christian Schoenebeck wrote:
> On Freitag, 4. Februar 2022 16:54:12 CET Philippe Mathieu-Daudé wrote:
>> On 4/2/22 16:50, Dmitry V. Levin wrote:
>>> On Fri, Feb 04, 2022 at 06:32:07PM +0300, Vitaly Chikunov wrote:
>>> [...]
>>>
>>>>> struct dirent *
>>>>> qemu_dirent_dup(struct dirent *dent)
>>>>> {
>>>>>
>>>>>       size_t sz = offsetof(struct dirent, d_name) + _D_EXACT_NAMLEN(dent)
>>>>>       + 1;
>>>>
>>>> But d_namlen is not populated by synth_direntry, so this will lead to
>>>> a bug too. Idea is that qemu_dirent_dup handles real dirents and
>>>> simulated (underpopulated) dirents.
>>>>
>>>> Also Linux does not have d_namlen AFAIK, thus this code will not provide
>>>> any speed up in most cases (and always fallback to strlen), unlike if we
>>>> use d_reclen.
>>>>
>>>> Also, I m not sure if _D_EXACT_NAMLEN is defined on all systems, so this
>>>> needs ifdefs too.
>>>
>>> Yes, _D_EXACT_NAMLEN() is a GNU extension, it was introduced in glibc
>>> back in 1996 but some popular libcs available for Linux do not provide
>>> this macro.
>>
>> Can't we define _D_EXACT_NAMLEN() if not available?
> 
> It is not that trivial.
> 
> With recent macOS patch set in mind: macOS does not have any of these macros
> either. It does have d_namlen and d_reclen though. Keep in mind though that
> macOS also has d_seekoff which is almost always zero though.
> 
> So please, don't blindly define something, test it! On doubt I stick with
> Vitaly's solution, because it just works^TM.

Note I haven't NAck'ed this approach, I am simply looking at a better
alternative if possible.

