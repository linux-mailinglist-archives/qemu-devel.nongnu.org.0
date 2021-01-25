Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0EF30278F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:15:09 +0100 (CET)
Received: from localhost ([::1]:38024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44WC-0001xO-L1
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:15:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l44Tn-0000wM-Rz
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:12:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l44Tm-0005i9-4q
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611591156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Iz5P1skW7zPVXzCHfFp0BKqlGXS5TdpwKH+tfvq+Tsk=;
 b=L3dQbmrhd0NWy+VpUUbstoaClG6S3JvGoZmMBXwBdVZ1TatqaO5eOucM2DGb3dt3NxKaBD
 l7znvIBh2uu8wvv0EeDoKzNeWrPScT/pL7TP02BOUPV9VFIKICIEeDIuS4G9YHZkv7j09o
 GSyAD/rSTBcVDuQfqpoK7UUeFtd/PoM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-OwVLkhDePqyVk8DcLocE6g-1; Mon, 25 Jan 2021 11:12:35 -0500
X-MC-Unique: OwVLkhDePqyVk8DcLocE6g-1
Received: by mail-qv1-f69.google.com with SMTP id l3so5268030qvz.12
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 08:12:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iz5P1skW7zPVXzCHfFp0BKqlGXS5TdpwKH+tfvq+Tsk=;
 b=IZu+Gi+EGqc82fYi7YXwXH6ZPiVRoKCTP9bKPa5o4qCC1Ov67uCWhzzIWpJmvtVBR+
 YR8qAi8l058R+IsCHRORhJ/1ZcnCfAtcUytHmar06gXtBlI+7/OcIhItxkLBW7Iepj7v
 cRmaJJNQRwFB7mbN31m7pRRJyh2nKtYl7By9OfKhPTzOHPzw1ig76rkJa90SrfBdn8Is
 0iBOZs/ePovS2PYXWSMtzMGbzY0apQ3Aj9SbiOM5I5RpKeD77s06z+wlcjqVo1qGxVBk
 o0rM/e9t8R0NywiJrr0+H/ve0Vb27tunv1y5GblxMF+n7l4M9L73hY9ZNh4zf3wOTGAb
 gHUA==
X-Gm-Message-State: AOAM532BBACHWnUx2v6TBuktvAGGFddfoeGi+tusnIQaOkMpqTBRZ8mF
 o1zURRmFpfaVpBhRMWDcaavt6FeR4C6h6sWhH6OHBBIsSAR+RVyXrgmw1H8wbikkkuQD8ul2Vnu
 JPkw5tH0bd1raML2Sirm+Z+AKMnSB9m4=
X-Received: by 2002:a05:620a:2155:: with SMTP id
 m21mr1384283qkm.395.1611591154670; 
 Mon, 25 Jan 2021 08:12:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUYuEccUNnkQ76q6Y+Kwp4kf6ZHKNlvlMCwdqjYHeszC0ZRkCvMS4RegWPGyKu9zhjrbf7bb0KBf3a9iMfYQ8=
X-Received: by 2002:a05:620a:2155:: with SMTP id
 m21mr1384268qkm.395.1611591154508; 
 Mon, 25 Jan 2021 08:12:34 -0800 (PST)
MIME-Version: 1.0
References: <20210121144429.58885-1-stefanha@redhat.com>
In-Reply-To: <20210121144429.58885-1-stefanha@redhat.com>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Mon, 25 Jan 2021 17:12:23 +0100
Message-ID: <CAOssrKfjLrR0TXqPgk7sYAz9xiuNankgQpOtX69-zXWaGOnu6w@mail.gmail.com>
Subject: Re: [PATCH] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mszeredi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mszeredi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Sergio Lopez Pascual <slp@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Alex Xu <alex@alxu.ca>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 3:44 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:

> This patch adds the missing checks to virtiofsd. This is a short-term
> solution because it does not prevent a compromised virtiofsd process
> from opening device nodes on the host.

I think the proper solution is adding support to the host in order to
restrict opens on filesystems that virtiofsd has access to.

My idea was to add a "force_nodev" mount option that cannot be
disabled and will make propagated mounts  also be marked
"force_nodev,nodev".

A possibly simpler solution is to extend seccomp to restrict the
process itself from being able to open special files.  Not sure if
that's within the scope of seccomp though.

Thanks,
Miklos


