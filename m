Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406A5567242
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:15:37 +0200 (CEST)
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8kH0-0002Vy-GQ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o8kFL-00016a-QF
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o8kFE-0003Yj-NQ
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:13:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657034021;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OJIujAbJ4UM6RsIQ2jqaUTm2Vvp+k7ePUqrf4KSljXE=;
 b=EU1uPyIZyrXOr2qZk4NwXzjYMAA8XtEMcohkgzbAfYb1+eJlS0LACNRMQw6a2kL8GlvPIx
 d0ygEbwB2n/qyjWZ0GsEcIncsAW6n8YrymjubPbAVcVJ76AR+7iXOHW+rZHlOiLRiyoaRw
 q12HKckZILnIDT7fBEPbyRuK4C63nDc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-L8wPg-i5PxmGAmQPUoBu0A-1; Tue, 05 Jul 2022 11:13:40 -0400
X-MC-Unique: L8wPg-i5PxmGAmQPUoBu0A-1
Received: by mail-wr1-f69.google.com with SMTP id
 n5-20020adf8b05000000b00219ece7272bso2022307wra.8
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 08:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OJIujAbJ4UM6RsIQ2jqaUTm2Vvp+k7ePUqrf4KSljXE=;
 b=oOpG4b4FlljPBSPrkGVnBK8oPdpK0JfZXYVja6sG/3BS8sSlyWdSm+5kUqoL7q25Yb
 aoHWE7Q4oY6OdV4blHgSRtV0Zvdj/6TZufhG8FWD76z4QuOPHZyAd9hQzhDlpUNuNgor
 k8+IUEYPHY9aC1CM0NVDiAtQ84FcXF8rzrLPvEnKFj042ZL6N5ZvmcbvOb1jCSYFKGQX
 w+2edupGLJ9ZNjkSqugO3DUAmqG/lGlHFNnbkVLZkok/gSstD4xcSncNLJCZKxHClcD+
 YKF9z4U43ZijlIM+BN3GY4ZoSC6ombMchAv9ZC2pJDsaaoTJ4uSSepam2rgbJMrpoP+N
 GFtg==
X-Gm-Message-State: AJIora9tqXB2TFb9V29op6+oRI7ZZ+8JeEXjawGiVcXDZsbpSAyrgpMV
 U3fy8gOct1mqn3bEnHfd1L0pbkB7yoIAZKsICgxzomirgdpGeyMDj9ND0chD7dyFNZ76r5IM3Ra
 N1xas668CFPppSxs=
X-Received: by 2002:a5d:5c0c:0:b0:21b:c9cb:f973 with SMTP id
 cc12-20020a5d5c0c000000b0021bc9cbf973mr31499975wrb.424.1657034018341; 
 Tue, 05 Jul 2022 08:13:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1slHuWAT+AO+YTU43gUvGgLIwjtIN+v7X3SpH2X1os7V32aM8YcTSw2G3QyrJL7rRyJWz2VxA==
X-Received: by 2002:a5d:5c0c:0:b0:21b:c9cb:f973 with SMTP id
 cc12-20020a5d5c0c000000b0021bc9cbf973mr31499959wrb.424.1657034018159; 
 Tue, 05 Jul 2022 08:13:38 -0700 (PDT)
Received: from localhost (static-110-87-86-188.ipcom.comunitel.net.
 [188.86.87.110]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056000018200b002103cfd2fbasm33331784wrx.65.2022.07.05.08.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 08:13:37 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  qemu-devel@nongnu.org,
 Leonardo Bras <leobras@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <f4bug@amsat.org>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 5/5] multifd: Only sync once each full round of memory
In-Reply-To: <YsRL6Y4/3puuVC3S@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 5 Jul 2022 15:34:17 +0100")
References: <20220621140507.1246-1-quintela@redhat.com>
 <20220621140507.1246-6-quintela@redhat.com> <YsRDEyA0mjUD4DSB@work-vm>
 <YsRL6Y4/3puuVC3S@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 05 Jul 2022 17:13:36 +0200
Message-ID: <87y1x7zj6n.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> On Tue, Jul 05, 2022 at 02:56:35PM +0100, Dr. David Alan Gilbert wrote:
>> * Juan Quintela (quintela@redhat.com) wrote:
>> > We need to add a new flag to mean to sync at that point.
>> > Notice that we still synchronize at the end of setup and at the end of
>> > complete stages.
>> >=20
>> > Signed-off-by: Juan Quintela <quintela@redhat.com>
>> > ---
>> >  migration/migration.c |  2 +-
>> >  migration/ram.c       | 42 ++++++++++++++++++++++++++++++------------
>> >  2 files changed, 31 insertions(+), 13 deletions(-)
>> >=20
>> > diff --git a/migration/migration.c b/migration/migration.c
>> > index 3f79df0b70..6627787fc2 100644
>> > --- a/migration/migration.c
>> > +++ b/migration/migration.c
>> > @@ -4283,7 +4283,7 @@ static Property migration_properties[] =3D {
>> >                        DEFAULT_MIGRATE_ANNOUNCE_STEP),
>> >      /* We will change to false when we introduce the new mechanism */
>> >      DEFINE_PROP_BOOL("multifd-sync-each-iteration", MigrationState,
>> > -                      multifd_sync_each_iteration, true),
>> > +                      multifd_sync_each_iteration, false),
>> >=20=20
>> >      /* Migration capabilities */
>> >      DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
>> > diff --git a/migration/ram.c b/migration/ram.c
>> > index 2c7289edad..6792986565 100644
>> > --- a/migration/ram.c
>> > +++ b/migration/ram.c
>> > @@ -81,6 +81,7 @@
>> >  #define RAM_SAVE_FLAG_XBZRLE   0x40
>> >  /* 0x80 is reserved in migration.h start with 0x100 next */
>> >  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
>> > +#define RAM_SAVE_FLAG_MULTIFD_SYNC     0x200
>>=20
>> Note this is the very last usable flag!
>> We could do with avoiding using them as flags where we dont need to.
>
> Before it is too late, shouldn't we do
>
>    #define RAM_SAVE_FLAG_BIGGER_FLAGS 0x200=20=20
>
> to indicate that this will be followed by another uint64 value
> giving us another 64 flags to play with ?

Dunno.  We can recover 2 bits already as I told on the previous answer.
And another two/three once that we move to multifd, so we should be ok
(famous last words).

Once told that, putting a comment saying what is the biggest possible
value looks like a good idea.

Later, Juan.


