Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910D4498DA8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 20:37:17 +0100 (CET)
Received: from localhost ([::1]:57642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC59Q-00014t-C8
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 14:37:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC55y-0007Ke-N6
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 14:33:44 -0500
Received: from [2a00:1450:4864:20::429] (port=42512
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC55k-0004bt-Ns
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 14:33:41 -0500
Received: by mail-wr1-x429.google.com with SMTP id a13so15567529wrh.9
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 11:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zXE84xavJpua/vuyv1gCjreYuRXMfYD7S+eieG6IRLY=;
 b=dM6XDZGL9gTfSbEMno8FBuMmMAVCh9DzAmxVhChA0j7zCPDLIM+vL9fPrMVqmYoewe
 s3VTrvgAUwpXEmx/ru74jCjfpdXRJyKmIbXRoEudo6dTGDA3Zt+ddIzMcmIED0NVUTqi
 Xmcgu/NZp9W42HQvdmUFpz1l9bguDVHS/mYO4vm3IfCre722YvADlx9lI49rbcTWDINz
 VG4NqLT3vJdwUJgZ6W9tX5mGatRQw9z59ogGq/7eEff4qyIKDJoGRAY8LpWGLXO/K5tW
 nxJY4jWccXrX/2SNnWpraI5GmVW08qLOI5TzpZ943fOIGlmLRC/FwwB6IDCxO6341A5r
 o6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zXE84xavJpua/vuyv1gCjreYuRXMfYD7S+eieG6IRLY=;
 b=fTPotFgschSQSI5OgfOzKJAYWGsDrhJd6RHLJGpOvkHTIOlybdq3zUsXmnVgI4AB0c
 mi8ZnZWAC+p6IwS8fausqYNFFmRHja/3VIuDAftUkccA3CGMfwxpmUYMvjeB0KRashIU
 dk6d4EHoHomUy4Ze+JXZZg8LtR/6lPbGAVPeZ4sw0+adgpHOGiG20eqL7Mc0RT9FrNba
 CteePVxnXhSU0O/wUdDTS6IKouA2WCE/py1svVEmFPyXUmgv7EXNVqb0B5xyCjQ8qweA
 8u+tajxvf89eJEDR2xJ6ha8pzCF9v9a+AN07x3rtgrnYBIfjrMo/66CQG2SBcT1E+vOc
 Wngw==
X-Gm-Message-State: AOAM531zPuaViGzd3K43lou7L/oy/iuGGjtlR8vA3TdINA1IAv65JvYX
 W9pYktmYO3t44hKbRIL+J5k=
X-Google-Smtp-Source: ABdhPJwk+fJup3k6YnaiXeaQcfXcebTYBeVlJIGWvVttr4P2ExMjAtgA/pjUmeDIE/muh4wn9IHxoQ==
X-Received: by 2002:a5d:588c:: with SMTP id n12mr15426130wrf.413.1643052805117; 
 Mon, 24 Jan 2022 11:33:25 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id f12sm14628352wrs.1.2022.01.24.11.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 11:33:24 -0800 (PST)
Message-ID: <efc5f304-f3d2-ff7b-99a6-673595ff0259@amsat.org>
Date: Mon, 24 Jan 2022 20:33:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 0/7] tests: Refresh lcitool submodule & remove libxml2
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel@nongnu.org, Ed Maste <emaste@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
References: <20220121154134.315047-1-f4bug@amsat.org>
 <87mtjle71g.fsf@linaro.org> <4dc22a36-52da-26fb-bf8e-5e27e91db359@amsat.org>
 <87ee4xdjjp.fsf@linaro.org>
In-Reply-To: <87ee4xdjjp.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/24/22 20:16, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> On 1/24/22 11:55, Alex Bennée wrote:
>>>
>>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>>
>>>> This is my last respin on this series which is fully reviewed.
>>>>
>>> <snip>
>>>
>>> Just to note the "b4" application of this broke the From addresses. If
>>> you see the lore copy:
>>>
>>>   https://lore.kernel.org/qemu-devel/20220121154134.315047-1-f4bug@amsat.org/
>>>
>>> all your From's are via qemu-devel. Have you changed anything about your
>>> submission process?
>>
>> No. Maybe the list changed something again? Similar problem occurred
>> 18 months ago IIRC. Not sure what I can do, the domain misses SPF/DKIM:
>> https://toolbox.googleapps.com/apps/checkmx/check?domain=amsat.org
> 
> I thought so but others in the archives are fine. I take it you can't ask
> the owners of amsat.org to expand the SPF setting or use the MX server
> indicated to send emails?
> 
> Otherwise it might be worth either getting your own gmail or domain for
> posting.

=)

I'm seeing the same with Mark's email: Mark Cave-Ayland via
<openbios-bounces@openbios.org> maybe Google is running a global SMTP purge?

Similar SPF/DKIM errors:
https://toolbox.googleapps.com/apps/checkmx/check?domain=ilande.co.uk

> 
>>
>> If it helps you can get them on my branch macos12:
>> https://gitlab.com/philmd/qemu/-/compare/5e9d14f2...36d00943e?from_project_id=6939745
> 
> I nabbed it with my old-school patch handling which still works but
> doesn't auto collect tags for me ;-)
> 

