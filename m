Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910C55BF271
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:51:26 +0200 (CEST)
Received: from localhost ([::1]:46990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oanxV-0007rI-N9
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oanth-0004pQ-4O
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 20:47:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oantd-00077V-Df
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 20:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663721244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FZeYVkUTmzhNmpH0onwcr/mcZBA27FW9doDyeSPyQZo=;
 b=E6Vf8gHOHB+TbUI/TIWRFxsO+7ylNRKsypVatX+Xyx4jqATPW8ysnmh5FWgxMgbQbXnueS
 lktuU5nlfCuL5VDQioRIE9sl0VVKlUT7qb1IVJV/65bAFDX7nhoVVZjuKBgW0TimXfTFQn
 lSq/jFzRVGi4qPz9qvlfdlCNa6Vszfk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-550-KF8pLvVXOwWsrCpp-JU7AA-1; Tue, 20 Sep 2022 20:47:23 -0400
X-MC-Unique: KF8pLvVXOwWsrCpp-JU7AA-1
Received: by mail-qv1-f70.google.com with SMTP id
 dw19-20020a0562140a1300b004a8eee124b4so3222100qvb.21
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 17:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=FZeYVkUTmzhNmpH0onwcr/mcZBA27FW9doDyeSPyQZo=;
 b=dx5JDCDrxSTdiy+czZkFmrzuhrWq6E6F2FS4Z2t+JlhQ6sEpPQI9NzFtL/vEEOWFTS
 92dHLuwWHFdzOeNBCBfS64aPgiEQWK5MBlYtO5TJDODz9EotPV5eQhcmLCZdOMWCfZ7f
 WHBkkSgohcrdX1TzIzyGfF91/FID1qOERKudHnlI865OGS7l5IeLX24oVAk6Xtua4KaN
 3hnUWPxZ8L28GbE26Y+DL7/b4sU5rLU/z1USIHT66KJrv9tIMsEUOkR60a+98ECLl9x0
 l90A3WqTUOkva3/WZe2+WfuQTMr71LtcwmvysczS/GNVnhPMXI/K4f2osjE+6b2fna2R
 7Sug==
X-Gm-Message-State: ACrzQf2KU8KybN/sNW0YvN3q0mK3RUXHbKv+Rm4IfNTPJ8lQa8mfhAHz
 YCqZttNga4shWm/C2PNjObCDA/Z4XBI67mibth6vSmO29m1bcHjCVfVrNgI7GXRM3FrSFT0dc90
 J1E0/+QsVYiwo4UPchIA9a6Z5nmyCzOJFPWULF7lNMsi19aQ3B96lpGsSlwUL/vV1
X-Received: by 2002:a05:6214:2528:b0:4ad:6fa4:4170 with SMTP id
 gg8-20020a056214252800b004ad6fa44170mr593628qvb.113.1663721242476; 
 Tue, 20 Sep 2022 17:47:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Kj01Gtc/0Bbb+j3mlnqSXi9/C3pA+LrDgsjSdNRbeJulIczwhDWc22fjTpd3hILK2H5Jzsw==
X-Received: by 2002:a05:6214:2528:b0:4ad:6fa4:4170 with SMTP id
 gg8-20020a056214252800b004ad6fa44170mr593611qvb.113.1663721242231; 
 Tue, 20 Sep 2022 17:47:22 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 e19-20020ac86713000000b0035bb6c3811asm657502qtp.53.2022.09.20.17.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 17:47:21 -0700 (PDT)
Date: Tue, 20 Sep 2022 20:47:20 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 13/14] migration: Remove old preempt code around state
 maintainance
Message-ID: <YypfGODnHAc8oJsW@xz-m1.local>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225227.49158-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220920225227.49158-1-peterx@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Tue, Sep 20, 2022 at 06:52:27PM -0400, Peter Xu wrote:
> With the new code to send pages in rp-return thread, there's little help to
> keep lots of the old code on maintaining the preempt state in migration
> thread, because the new way should always be faster..
> 
> Then if we'll always send pages in the rp-return thread anyway, we don't
> need those logic to maintain preempt state anymore because now we serialize
> things using the mutex directly instead of using those fields.
> 
> It's very unfortunate to have those code for a short period, but that's
> still one intermediate step that we noticed the next bottleneck on the
> migration thread.  Now what we can do best is to drop unnecessary code as
> long as the new code is stable to reduce the burden.  It's actually a good
> thing because the new "sending page in rp-return thread" model is (IMHO)
> even cleaner and with better performance.
> 
> Remove the old code that was responsible for maintaining preempt states, at
> the meantime also remove x-postcopy-preempt-break-huge parameter because
> with concurrent sender threads we don't really need to break-huge anymore.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.c |   2 -
>  migration/ram.c       | 258 +-----------------------------------------
>  2 files changed, 3 insertions(+), 257 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index fae8fd378b..698fd94591 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -4399,8 +4399,6 @@ static Property migration_properties[] = {
>      DEFINE_PROP_SIZE("announce-step", MigrationState,
>                        parameters.announce_step,
>                        DEFAULT_MIGRATE_ANNOUNCE_STEP),
> -    DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
> -                      postcopy_preempt_break_huge, true),

Forgot to drop the variable altogether:

diff --git a/migration/migration.h b/migration/migration.h
index cdad8aceaa..ae4ffd3454 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -340,13 +340,6 @@ struct MigrationState {
     bool send_configuration;
     /* Whether we send section footer during migration */
     bool send_section_footer;
-    /*
-     * Whether we allow break sending huge pages when postcopy preempt is
-     * enabled.  When disabled, we won't interrupt precopy within sending a
-     * host huge page, which is the old behavior of vanilla postcopy.
-     * NOTE: this parameter is ignored if postcopy preempt is not enabled.
-     */
-    bool postcopy_preempt_break_huge;
 
     /* Needed by postcopy-pause state */
     QemuSemaphore postcopy_pause_sem;

Will squash this in in next version.

-- 
Peter Xu


