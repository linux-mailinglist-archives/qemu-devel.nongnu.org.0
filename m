Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF234E276B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 14:22:05 +0100 (CET)
Received: from localhost ([::1]:50918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWHz2-0003iG-10
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 09:22:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrea.righi@canonical.com>)
 id 1nWCte-0003LW-3o
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 03:56:10 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrea.righi@canonical.com>)
 id 1nWCtY-0007ka-SB
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 03:56:09 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EE2873F1C0
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 07:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647849357;
 bh=uFuBmms42aPmvQcreu/ayndBUtUKwJx/UYqxGQ1JWT4=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To;
 b=WU/lMuv5K8WMrCLdRQKys6RmPwbcpxmkYNbNncCsYtzpcnttU7LW6Z85B6A5K/+Bu
 kwKYQ4xJ9TPJWGTzr+jkz3x/zGAZb0V7PEZLuXC7/QsbQahsPFwTWuHw/w1o4pHaxj
 QjZDKiFbT+8EK6Udn+SASyKxLPBKV1wiK0dsZn5NalGpg4QMQ4GJAbHp485J1h3+HS
 gnAaknFu2ejLj7CejYQ6oCS7bviKhAq/bqJPovPP4+mEEy3DV73GuouOUFyj5SKBsM
 U3STVhsdXkKN7VcgxjWFGvZkPOV9zQbZ8A3PJsTv9Czkdy+baADddneB/cWJBZoRxY
 fO+KmCJpEyGUA==
Received: by mail-wr1-f71.google.com with SMTP id
 f14-20020adfc98e000000b001e8593b40b0so2814941wrh.14
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 00:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uFuBmms42aPmvQcreu/ayndBUtUKwJx/UYqxGQ1JWT4=;
 b=UNRb07V4idhjk59c2nmo0hOV7+EGUayAu9AG87UYGuDumo2KVYUud4CGlc9Hjd90kJ
 10k4IxGk6RGzRN+tjq8WeZGZziq5r6v3D7OpP3zEqrjcEqy9eiOzLEZZoFS+urJLMXQ4
 dpwnUtvEs7BnlwokXJXR3ZXYmx4J2/kFcoO0H2fK8stobRumJUsJ2uRGHaMvP2pPMu3t
 iCeZxyHbqzL9KG4t7JFaaOV05tUTTVBiMvWd/fCACfhYYcdAkS69Rjc9JGCP28JhbUu+
 TRVMpCSroBShzKlgYbT20q7OhqZvdZBbA1BH/Dyqkwukk3so+lu2mqjtujr1Cfahg63K
 dM+w==
X-Gm-Message-State: AOAM530vHxiYEsIviu5PcYUVQRW/uu8TtwTrRpk/elkI6lEoHxcD/sgJ
 bNXmRrJhV8jQffOMkpJKCoQXjsVZNHSod8+Ia4XTkV+Fy0qNv6bIYzkaKxj2pttYIYVAAQth0Bz
 IhqW5fMF+NsB0WHa7LAGyOPghJ/BsLbJD
X-Received: by 2002:adf:9dc6:0:b0:203:fb2d:75d6 with SMTP id
 q6-20020adf9dc6000000b00203fb2d75d6mr10604287wre.571.1647849357651; 
 Mon, 21 Mar 2022 00:55:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5FhylrgLJ/zfqITE/clfB8NUfeFAm8JAlNprg6e9GRJZBumOjpzwC6xIVCcqSeycZNKBVuA==
X-Received: by 2002:adf:9dc6:0:b0:203:fb2d:75d6 with SMTP id
 q6-20020adf9dc6000000b00203fb2d75d6mr10604273wre.571.1647849357305; 
 Mon, 21 Mar 2022 00:55:57 -0700 (PDT)
Received: from localhost ([2001:67c:1560:8007::aac:c1b6])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a5d6c6c000000b00203ec2b1255sm11237325wrz.60.2022.03.21.00.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 00:55:56 -0700 (PDT)
Date: Mon, 21 Mar 2022 08:55:55 +0100
From: Andrea Righi <andrea.righi@canonical.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [libvirt RFC] virFile: new VIR_FILE_WRAPPER_BIG_PIPE to improve
 performance
Message-ID: <Yjgtw9AWsFy/Ssvr@arighi-desktop>
References: <Yi94mQUfrxMVbiLM@redhat.com>
 <34eb53b5-78f7-3814-b71e-aa7ac59f9d25@suse.de>
 <Yi+ACeaZ+oXTVYjc@redhat.com>
 <2d1248d4-ebdf-43f9-e4a7-95f586aade8e@suse.de>
 <7c641d9d-fffa-e21b-7ae2-12ad35c0c238@suse.de>
 <YjMMfnEjXsz3Vi8h@redhat.com>
 <f94f9d54-b71b-e8ff-1a5b-931e42120e4e@suse.de>
 <35da2366-99e4-7680-a1c5-46aff83d747c@suse.de>
 <YjNNqzb7eBBwMFJN@work-vm>
 <737974fa-905c-d171-05b0-ec4df42bc762@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <737974fa-905c-d171-05b0-ec4df42bc762@suse.de>
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=andrea.righi@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 21 Mar 2022 09:18:17 -0400
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
Cc: libvir-list@redhat.com, Jiri Denemark <jdenemar@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 02:34:29PM +0100, Claudio Fontana wrote:
...
> I have lots of questions here, and I tried to involve Jiri and Andrea Righi here, who a long time ago proposed a POSIX_FADV_NOREUSE implementation.
> 
> 1) What is the reason iohelper was introduced?
> 
> 2) Was Jiri's comment about the missing linux implementation of POSIX_FADV_NOREUSE?
> 
> 3) if using O_DIRECT is the only reason for iohelper to exist (...?), would replacing it with posix_fadvise remove the need for iohelper?
> 
> 4) What has stopped Andreas' or another POSIX_FADV_NOREUSE implementation in the kernel?

For what I remember (it was a long time ago sorry) I stopped to pursue
the POSIX_FADV_NOREUSE idea, because we thought that moving to a
memcg-based solution was a better and more flexible approach, assuming
memcg would have given some form of specific page cache control. As of
today I think we still don't have any specific page cache control
feature in memcg, so maybe we could reconsider the FADV_NOREUSE idea (or
something similar)?

Maybe even introduce a separate FADV_<something> flag if we don't want
to bind a specific implementation of this feature to a standard POSIX
flag (even if FADV_NOREUSE is still implemented as a no-op in the
kernel).

The thing that I liked about the fadvise approach is its simplicity from
an application perspective, because it's just a syscall and that's it,
without having to deal with any other subsystems (cgroups, sysfs, and
similar).

-Andrea

> 
> Lots of questions..
> 
> Thanks for all your insight,
> 
> Claudio
> 
> > 
> > Dave
> > 
> >> Ciao,
> >>
> >> C
> >>
> >>>>
> >>>> In the above tests with libvirt, were you using the
> >>>> --bypass-cache flag or not ?
> >>>
> >>> No, I do not. Tests with ramdisk did not show a notable difference for me,
> >>>
> >>> but tests with /dev/null were not possible, since the command line is not accepted:
> >>>
> >>> # virsh save centos7 /dev/null
> >>> Domain 'centos7' saved to /dev/null
> >>> [OK]
> >>>
> >>> # virsh save centos7 /dev/null --bypass-cache
> >>> error: Failed to save domain 'centos7' to /dev/null
> >>> error: Failed to create file '/dev/null': Invalid argument
> >>>
> >>>
> >>>>
> >>>> Hopefully use of O_DIRECT doesn't make a difference for
> >>>> /dev/null, since the I/O is being immediately thrown
> >>>> away and so ought to never go into I/O cache. 
> >>>>
> >>>> In terms of the comparison, we still have libvirt iohelper
> >>>> giving QEMU a pipe, while your test above gives QEMU a
> >>>> UNIX socket.
> >>>>
> >>>> So I still wonder if the delta is caused by the pipe vs socket
> >>>> difference, as opposed to netcat vs libvirt iohelper code.
> >>>
> >>> I'll look into this aspect, thanks!
> >>

