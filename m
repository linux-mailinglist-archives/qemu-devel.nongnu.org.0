Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE2F3D12CC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 17:49:43 +0200 (CEST)
Received: from localhost ([::1]:44852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ETe-0001pN-Oh
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 11:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6EQ1-0007Y8-Sc
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:45:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6EPz-0008Nv-In
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626882354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pgDgvVaiucvvtJ+8ZPDw6QYQ/2MBUYGg4QDx5boI2Ts=;
 b=N3e2FmIdLjSO8mznH8hFHuMy/KFQQ807tNZQTvf3kTGoazujY0spYO3uDP3CfLfBel8Wov
 DhReA4Qf3ccAC9hvvpuq67DW31UGfo/y/KIgZv/Ss63heXo6pE+MspKWQOgmF5bdO3jsro
 KU1ANSIGn/VgJbAx+pogxl9avwHGHN4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-pfV5fsVbNZSh4IVwmfbUuA-1; Wed, 21 Jul 2021 11:45:53 -0400
X-MC-Unique: pfV5fsVbNZSh4IVwmfbUuA-1
Received: by mail-qk1-f200.google.com with SMTP id
 o14-20020a05620a0d4eb02903a5eee61155so1974940qkl.9
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 08:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pgDgvVaiucvvtJ+8ZPDw6QYQ/2MBUYGg4QDx5boI2Ts=;
 b=idsYhjznLnZmvmgf59HrIxaPY1BiVIXx/y6Zqj7eEXt9hsL2/R4PkOfSCIFeOAMScM
 Y+FrdUawAm6VyU7LVONShuLn6ebaf4xAox/vpw2/pZlKCTGdqYcypYuEhg+1z0b2OMMo
 AKJpibA7np+nqGx78V2oN5sSJi/IsmOXnTqX48lNhVs0Kw8/PgoWGVQl1HyxDQ9YJnjj
 Nc3xNVgZhrHjIfa4WPQSgSF1G9BAC8ySOFPfcdrbgd3s47ncZ9q/Ufwybx0PtS58Aeif
 YO6nXjQNlWSAbqsANog2i2KGg4R6xvPq/qPsFIs/JdLCCqUDnnoOBbd+4iOyiIu60dBu
 l2Jg==
X-Gm-Message-State: AOAM530Ly2GREZm/rIPYBwwQjOd7nVCNtVfow+BCcnLsluZ/FRJzOF2I
 IWKx9cDxSDHjYPAidRtNsXFkMY9o6uKWaPOTXn3xp3GEFIAruYsZ0hIh9QVBB0CREnmmxQo0pIA
 +suRwBaSOHhques4=
X-Received: by 2002:a05:620a:10aa:: with SMTP id
 h10mr34719295qkk.377.1626882352633; 
 Wed, 21 Jul 2021 08:45:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7NYZt3e2f49ir1tY2kCeA53JNQO1MjYYb8GgjQt5NJPp00ZyZhVw9YE5J5tkydihLuwd4DA==
X-Received: by 2002:a05:620a:10aa:: with SMTP id
 h10mr34719279qkk.377.1626882352419; 
 Wed, 21 Jul 2021 08:45:52 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id ay39sm704546qkb.111.2021.07.21.08.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 08:45:51 -0700 (PDT)
Date: Wed, 21 Jul 2021 11:45:50 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 5/5] migration: Move the yank unregister of channel_close
 out
Message-ID: <YPhBLk9xvjCwsyaX@t490s>
References: <20210721012134.792845-1-peterx@redhat.com>
 <20210721012134.792845-6-peterx@redhat.com>
 <YPf5aVKZ4BcBlF60@work-vm>
MIME-Version: 1.0
In-Reply-To: <YPf5aVKZ4BcBlF60@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 11:39:37AM +0100, Dr. David Alan Gilbert wrote:
> > +/*
> > + * Return the ioc object if it's a migration channel.  Note: it can return NULL
> > + * for callers passing in a non-migration qemufile.  E.g. see qemu_fopen_bdrv()
> > + * and its usage in e.g. load_snapshot().  So we need to check against NULL
> > + * before using it.  If without the check, migration_incoming_state_destroy()
> > + * could fail for load_snapshot().
> > + */
> > +QIOChannel *migration_file_get_ioc(QEMUFile *file)
> > +{
> > +    return file->has_ioc ? QIO_CHANNEL(file->opaque) : NULL;
> > +}
> 
> Do you think this should go in the previous patch where you created
> has_ioc?  Also the name is weird, qemu_file is probably right for
> everything in here.

Sure; let me just move it over with it renamed.  Thanks,

-- 
Peter Xu


