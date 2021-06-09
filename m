Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3FD3A1768
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:37:21 +0200 (CEST)
Received: from localhost ([::1]:58072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzKa-00064d-I7
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqzJb-0005Ho-5Z
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:36:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqzJU-0007KQ-G1
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623249371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CK9qhaS68ByhQrwbttLXSanGVKEmkzLUTk+Ew0g2/Q0=;
 b=UV/9ZbRYi+x7z0XzI4t+CmJykBAABeAL+6klAuCtezs/TuxnUQaoF7t5iuIb66tXmSgH2G
 5O3I3tQ4va424aNnDLHo36COdr9fwviGNjyckaUR8D45GlTiLzlrsobPE4v41w7eBlNJjt
 hMwr+NvHWKR4gYDqsZbYk2siHYEdL68=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-idocvn9qOD6hDCD1Nawftw-1; Wed, 09 Jun 2021 10:36:07 -0400
X-MC-Unique: idocvn9qOD6hDCD1Nawftw-1
Received: by mail-wm1-f72.google.com with SMTP id
 f22-20020a1c6a160000b029018f49a7efb7so2687187wmc.1
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 07:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CK9qhaS68ByhQrwbttLXSanGVKEmkzLUTk+Ew0g2/Q0=;
 b=a8mDx53ka8XnBtIS3ARA15yodXJfcgU2Xdkqu75srLnRGdr3LduZqw51PncPjJTKrL
 8wtayEJtN9LEDeZJOIsPkpsA7eILUP0+2FW3T3LRmxcmgCV3FGE70auw1tCk4og1UL8Y
 cCCmWrsyaCBvJqE7mJfE93KSdAFfYsdAZwcUm4KewGYX24/OpnCCuuEAL2TP7MLl+5bi
 dSboQ73SaRxo7+lYaT4TRgfhE3L+LPs7Lit+2nKD9OMbcgQVVWI6pdKUDKrvSW56W7E2
 vSWU1jNde7PktxidXFN+d5u/JJcsGfWiawJbNRwtMgrAfDOlXRk5TmtzK63J6sqVSvzc
 oTbg==
X-Gm-Message-State: AOAM533/lyzW/G+81i0VbBl0sVSbRoubNJosID8zm+JkF9ppAjX71NkW
 6XoYi+XUWhFJjpKJksbhsNsuT303Ufw4XfJVVcWwlWODUtsGxtSg5eVhAEBm3FG3dXOCM2/cLV7
 O/KwNSQAqFiiB/EU=
X-Received: by 2002:a1c:8049:: with SMTP id b70mr10278074wmd.92.1623249366634; 
 Wed, 09 Jun 2021 07:36:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylHgJsuXRYdlUdczwrLKNF6/hrIj0w/23gVNuEbmYveRabyg1GMew9xM1dbHMTDitKXpjakw==
X-Received: by 2002:a1c:8049:: with SMTP id b70mr10278057wmd.92.1623249366462; 
 Wed, 09 Jun 2021 07:36:06 -0700 (PDT)
Received: from thuth.remote.csb (pd9e839fb.dip0.t-ipconnect.de.
 [217.232.57.251])
 by smtp.gmail.com with ESMTPSA id a3sm168158wra.4.2021.06.09.07.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 07:36:06 -0700 (PDT)
Subject: Re: [RFC QEMU PATCH] ui: Make the DisplayType enum entries conditional
To: Markus Armbruster <armbru@redhat.com>
References: <20210609100240.1285032-1-thuth@redhat.com>
 <8735trmb5a.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c06ff9af-d7d6-8771-b26d-b63863ac8ed0@redhat.com>
Date: Wed, 9 Jun 2021 16:36:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <8735trmb5a.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, smitterl@redhat.com, Eric Blake <eblake@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/2021 15.16, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> Libvirt's "domcapabilities" command has a way to state whether
>> certain graphic frontends are available in QEMU or not. Originally,
>> libvirt looked at the "--help" output of the QEMU binary to determine
>> whether SDL was available or not (by looking for the "-sdl" parameter
>> in the help text), but since libvirt stopped doing this analysis of
>> the help text, the detection of SDL is currently broken, see:
>>
>>   https://bugzilla.redhat.com/show_bug.cgi?id=1790902
>>
>> QEMU should provide a way via the QMP interface instead. The simplest
>> way, without introducing additional commands, is to make the DisplayType
>> enum entries conditional, so that the enum only contains the entries if
>> the corresponding CONFIG_xxx switches have been set. Unfortunately, this
>> only works for sdl, cocoa and spice, since gtk, egl-headless and curses
>> are hard-wired in the "data" section of the DisplayOptions, and thus
>> unfortunately always have to be defined.
> 
> Here:
> 
>      { 'union'   : 'DisplayOptions',
>        'base'    : { 'type'           : 'DisplayType',
>                      '*full-screen'   : 'bool',
>                      '*window-close'  : 'bool',
>                      '*show-cursor'   : 'bool',
>                      '*gl'            : 'DisplayGLMode' },
>        'discriminator' : 'type',
>        'data'    : { 'gtk'            : 'DisplayGTK',
>                      'curses'         : 'DisplayCurses',
>                      'egl-headless'   : 'DisplayEGLHeadless'} }
> 
> Flat union branches can be made conditional like so:
> 
>        'data'    : { 'gtk'            : { 'type': 'DisplayGTK',
>                                           'if': 'defined(CONFIG_GTK)' },
> 
> Then you should be able to make the corresponding enum value
> conditional, too.

Thanks for the hint, I'll give it a try!

  Thomas


