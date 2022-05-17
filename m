Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAA5529CA7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 10:38:23 +0200 (CEST)
Received: from localhost ([::1]:48510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqsik-0001K4-Dx
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 04:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqsf1-000832-GA
 for qemu-devel@nongnu.org; Tue, 17 May 2022 04:34:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqsey-00030s-7m
 for qemu-devel@nongnu.org; Tue, 17 May 2022 04:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652776466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HkbALEL6SorHC00he+phiayQ4qbvaOeZn8knNPY+Atg=;
 b=ZO1qUWZoPX9dXvCQdezjsnwCKFT6KV0/vHbrD6QLrCMABSauB+McESoODNhFXZ9K+qRIp4
 7PwKg7f0CewRIlD4Pmte2KFA/CotfT+q2G3rogVDZqb6SNzCiC+VE7fBrlaz6VQ6SP6fFH
 oR/x/2ES2MXWp9helRCArR5GsGYEJ6k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-hUX43BUpMT69nOZsrxRL1A-1; Tue, 17 May 2022 04:34:25 -0400
X-MC-Unique: hUX43BUpMT69nOZsrxRL1A-1
Received: by mail-wr1-f69.google.com with SMTP id
 u11-20020a056000038b00b0020c9ea8b64fso4409938wrf.2
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 01:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=HkbALEL6SorHC00he+phiayQ4qbvaOeZn8knNPY+Atg=;
 b=66zSK4tQFZjHyqBSZG4IZeEG0x2g/MhkKUZzQU4hcwaVzIuGuLfT0hID2FSa3KOxoW
 wMupaHrQbBhvPGcMRBdJ162cRXKgAFsXxj0enyS+ZOSu+tsotzMCpXMA5g34vyJdu8vK
 qSz5kN0a62vMIltdKjeZTTT4BLjYujsqPUiF+Y52ivPBE/XPPUm+P1SQRJqN4WLIFQ9Q
 DV7bO29fdtHm3Jj7JPp0ytL5V23s24WYebNrbhWSm1ZaLmZqIQE7FMCvHaDDuW2APHHE
 +/0yN7IZkFANDVcYzkQ9U2cOsPJtAXIlHcuIkvJQoR/Y4pb0I7DuDAyBOcDGMWngccsD
 uKow==
X-Gm-Message-State: AOAM533o25K20DwQ5OLIJqeYDm/L2LQ3UHjntOlWp3jic3+xgE+GVvjR
 2ThxA0j9dIET4vuv5cNxVddzoiGV1SHiC10qXVKVb/SjSOnGR7jM8S+zUin1beIq9Ttho2+GG67
 UObEygDUFmOW3658=
X-Received: by 2002:a7b:c041:0:b0:394:44a9:b017 with SMTP id
 u1-20020a7bc041000000b0039444a9b017mr20514448wmc.169.1652776464761; 
 Tue, 17 May 2022 01:34:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxODYelET9icrZW3sBJtJZc7wNNzWJc+hyUO6X2AelnUwlzg3wBDeoLdLix5A6QLQDmFWZgqA==
X-Received: by 2002:a7b:c041:0:b0:394:44a9:b017 with SMTP id
 u1-20020a7bc041000000b0039444a9b017mr20514425wmc.169.1652776464507; 
 Tue, 17 May 2022 01:34:24 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a05600c0a5600b00396fbf6f524sm1332964wmq.1.2022.05.17.01.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 01:34:23 -0700 (PDT)
Message-ID: <870d24be-6c37-ff3d-616b-68255345ebb9@redhat.com>
Date: Tue, 17 May 2022 10:34:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com
References: <20220511175147.917707-1-thuth@redhat.com>
 <20220511175147.917707-3-thuth@redhat.com> <878rr77xpn.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/3] ui: Switch "-display sdl" to use the QAPI parser
In-Reply-To: <878rr77xpn.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 12/05/2022 14.16, Markus Armbruster wrote:
[...]>           if (strstart(p, "sdl", &opts)) {
>      +        /*
>      +         * sdl DisplayType needs hand-crafted parser instead of
>      +         * parse_display_qapi() due to some options not in
>      +         * DisplayOptions, specifically:
>      +         *   - frame
>      +         *     Already deprecated.
>      +         *   - ctrl_grab + alt_grab
>      +         *     Not clear yet what happens to them long-term.  Should
>      +         *     replaced by something better or deprecated and dropped.
> 
> This sounds like it was mostly reluctance to drag undesirables into the
> QAPI schema.

Yeah, ctrl_grab and alt_grab were just too ugly and inflexible to drag them 
along into the QAPI world.

>      @@ -2179,6 +2189,10 @@ static void parse_display(const char *p)
>                   opts = nextopt;
>               }
>           } else if (strstart(p, "vnc", &opts)) {
>      +        /*
>      +         * vnc isn't a (local) DisplayType but a protocol for remote
>      +         * display access.
>      +         */
>               if (*opts == '=') {
>                   vnc_parse(opts + 1, &error_fatal);
>               } else {
> 
> This remains, and that's fine.  One step at time.

Not sure how we want to proceed with that in the long run, though ... IIRC 
clearly, Paolo once said that it doesn't really belong into "-display" 
anyway and should be handled with the separate "-vnc" option instead?

>>           Now that the problematic parameters have been removed, we can
>> switch to use the QAPI parser instead.
> 
> Here's my attempt at a more accurate commit message.
> 
>    The "-display sdl" option still uses a hand-crafted parser for its
>    parameters since we didn't want to drag an interface we considered
>    somewhat flawed into the QAPI schema.  Since the flaws are gone now,
>    it's time to QAPIfy.

Ok, I can update the description, thanks!

>> This introduces the new "DisplaySDL" QAPI struct that is used to hold
>> the parameters that are unique to the SDL display. The only specific
>> parameter is currently "grab-mod" which is modeled as a string, so that
>> it could be extended for other arbitrary modifiers later more easily.
> 
> Are the values of @grab-mod parsed in any way, or do we recognize a set
> of fixed strings?
> 
> The former would be problematic.  We try hard to represent complex data
> as JSON instead of inventing little ad hoc languages.
> 
> If it's the latter, use an enum.  Makes introspection more useful, and
> adding enumeration values is no harder than adding string literals.

It's currently only two strings that are used to replace the old behavior. 
But in the long run, I think it would be nice to have more flexibility here, 
so that a user could specify an arbitrary combination of modifier keys. I 
don't think that an enum will really scale here, so I'd prefer to go with 
the current approach and use the string for more flexibility.

  Thomas


