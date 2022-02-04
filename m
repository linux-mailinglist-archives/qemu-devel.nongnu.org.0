Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAD94A9C91
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:59:40 +0100 (CET)
Received: from localhost ([::1]:59722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0zr-0004bu-Ge
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:59:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG0uv-0007e6-6f; Fri, 04 Feb 2022 10:54:33 -0500
Received: from [2607:f8b0:4864:20::52d] (port=39900
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG0uo-0000la-Gl; Fri, 04 Feb 2022 10:54:32 -0500
Received: by mail-pg1-x52d.google.com with SMTP id j10so5357242pgc.6;
 Fri, 04 Feb 2022 07:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pOXfSqy03ixiCKQlrHSns7d2kOnWBYQOV3CSD1gQ7og=;
 b=fVGQQPZuCR2z9adVL0DnkBTgFy6nFZJNELmrZEN7RUPB7kJCICsmSuihY2z2LRNKoN
 tEzDgFrioIRWIDr5xth8xd1NcuoVzqAhaIVzZC1HwV5OUuw4zp1ixapMY1OGYiB+2n8u
 CI+f8oOSwYUi0FwVRgGhKOGze1U0rWaNgeQIT6d8NQuOK0QV/6MFxEzhGJgK7Y9IZ4eb
 luda/2tDATPQ8H7CoCJfEg7lsj5ZBCK7JJEpOtNIgHqcL7DZxIVDNkqQUjIH/DxSdIaV
 SIKi3kaGVr1h4mSjgOv9f+a12MMkazmG8bb4YyWdH9w16V79MYCJ4ewNZzB4KCjdDZx4
 1Hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pOXfSqy03ixiCKQlrHSns7d2kOnWBYQOV3CSD1gQ7og=;
 b=AXfPXFWryGQQYIl85GfiC41/qSGf6KIGonLHk4/eR6upPakqvAfPCYJ2pHjJIWQCiw
 em0M67gmThijFGpvIXUlPm5LXcGzfwk0c/X5Sbf9At35xiba47ehWtvWdb5DQtI0SZlt
 YblXuSvFaLvnxoGStEKe2JV7PRWmyAHiRppjVZFvVXYHYw1aGHBqUI4PFoeQ9OyV1Htc
 Tz2Kuv2dzlsfUvKjQ1McA6eDzXOhtq1aPTybUCUFZnewdlBJIk2qATJrEjpsL3TPv/m1
 sz0Pf5ma1UlNNBxyOVDZfFh+l5ZlV0tHGPG1rbMmapEbEtx6VQencEZiY5uzN4n9U9Dj
 b0sw==
X-Gm-Message-State: AOAM532zTVBEvI5GV5ZTV98LeR4nKv1NiSLswzhQU+Q05uvTWzffGmFZ
 tR9Hbbly8pk53yLDSdfdKco=
X-Google-Smtp-Source: ABdhPJyLEJpLrrlag+gxT4YfxKIevbrAChXvsG4oFjsk8FwwOlRcrodEWns2LfvZDhXx8Q/VvO2G6g==
X-Received: by 2002:a63:2ad6:: with SMTP id q205mr2757226pgq.46.1643990058505; 
 Fri, 04 Feb 2022 07:54:18 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id v9sm3271820pfu.60.2022.02.04.07.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 07:54:18 -0800 (PST)
Message-ID: <5c9d8b95-30ec-0801-ab26-51f40958b357@amsat.org>
Date: Fri, 4 Feb 2022 16:54:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Content-Language: en-US
To: "Dmitry V. Levin" <ldv@altlinux.org>, Vitaly Chikunov <vt@altlinux.org>,
 Greg Kurz <groug@kaod.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
References: <20220204050609.15510-1-vt@altlinux.org>
 <449c9c55-06e8-66ef-8755-3ab2e785851c@amsat.org> <28345882.VnrBaU8NEn@silver>
 <20220204161606.162d2c05@bahia>
 <20220204153207.k2t3dwq3pdzx7bk3@altlinux.org>
 <20220204155059.GA18407@altlinux.org>
In-Reply-To: <20220204155059.GA18407@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52d.google.com
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

On 4/2/22 16:50, Dmitry V. Levin wrote:
> On Fri, Feb 04, 2022 at 06:32:07PM +0300, Vitaly Chikunov wrote:
> [...]
>>> struct dirent *
>>> qemu_dirent_dup(struct dirent *dent)
>>> {
>>>      size_t sz = offsetof(struct dirent, d_name) + _D_EXACT_NAMLEN(dent) + 1;
>>
>> But d_namlen is not populated by synth_direntry, so this will lead to
>> a bug too. Idea is that qemu_dirent_dup handles real dirents and
>> simulated (underpopulated) dirents.
>>
>> Also Linux does not have d_namlen AFAIK, thus this code will not provide
>> any speed up in most cases (and always fallback to strlen), unlike if we
>> use d_reclen.
>>
>> Also, I m not sure if _D_EXACT_NAMLEN is defined on all systems, so this
>> needs ifdefs too.
> 
> Yes, _D_EXACT_NAMLEN() is a GNU extension, it was introduced in glibc
> back in 1996 but some popular libcs available for Linux do not provide
> this macro.

Can't we define _D_EXACT_NAMLEN() if not available?

