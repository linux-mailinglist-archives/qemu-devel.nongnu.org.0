Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC012C5B1F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 18:54:35 +0100 (CET)
Received: from localhost ([::1]:40598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiLTW-0002lx-BW
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 12:54:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antoine.damhet@blade-group.com>)
 id 1kiLDG-0004eU-9w
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:37:46 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antoine.damhet@blade-group.com>)
 id 1kiLDD-0006qc-O4
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:37:44 -0500
Received: by mail-wr1-x432.google.com with SMTP id s8so2962776wrw.10
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 09:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blade-group.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0nxGOi9953k6rDMKGiug0IYD+DzzLtq6aFdhSKIiPEs=;
 b=N+j5vNb7SyLTLKZ0lVVSqO3+ejXs46SbZAK02bqvZdj2TwtSVZvAVBnFLFPxfnDOhe
 aNOVy/kRDyXIgqedwoeo0l2ixgQ4419paT9VL3VfTQHExZQZ8N7KOhMd/2YSlA/EivQj
 2SEqKi+Q82pcrgfBrVyL6IL6rqdnf14d3NjjYZAMhHJX8PJwLfGrjOlgp6kAtxadvggo
 CssYmFVn8yt2sVOg8APawCUGpFSEJF9gYaSQC+4xlsz7i3fEg6t9D4LsDJM0699FqAvS
 wf5TPU63w5XcJNsI+ODqOH6/YjW6mxdVM+4lO7gDLgNSSvvjbHLzrcWyOuisj1YvJbmJ
 QtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0nxGOi9953k6rDMKGiug0IYD+DzzLtq6aFdhSKIiPEs=;
 b=MRkUfBjq4mbvANzSArTVjimrYyWaejw0yoLlBKXFHmD8el9KplcMpe5w+02oOf7kfN
 tbAA/fVbaZwax+ja0t6dA7XWTwwh+y+vluLn9lBACb1EHZ2EroCZ0PJZlOlkTHNM20Ox
 EVVupLk2ZAY8xgqsSGRnLb8qQ75iHra4Sy42Hfje/VhW8zVdMTzxPQys7rUMcU5ZXl2a
 iArNNeGo/7BaEPZSU4ZwDSzYQTzLMtSxeRsg1acJy3xNw53UylahcqwcY5l00v3VNkTz
 A7BbJtIQ+sNiFlHEcO45SViRb1WiwRqO7Kkxg8zLzaxqr08yohWlgHTeKrcz85pk7Bat
 Seyw==
X-Gm-Message-State: AOAM531x1pnnKpA+T587hp8ixdmPdVAAc1nbqE1F7ta/wI3rk41vU6jH
 p9BB/p+XTucEJ3eW481crB9PBg==
X-Google-Smtp-Source: ABdhPJyVS0tfoObJpJazPix1UiRUurW7cVqt+pTpg8enI0PZkzV43QbP/qgB68xyzUiIfZc2F7xnVw==
X-Received: by 2002:adf:d84b:: with SMTP id k11mr5201982wrl.305.1606412260274; 
 Thu, 26 Nov 2020 09:37:40 -0800 (PST)
Received: from localhost ([2a01:e34:ec16:8a90:4e1d:96ff:fe49:7109])
 by smtp.gmail.com with ESMTPSA id c17sm10565222wro.19.2020.11.26.09.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 09:37:39 -0800 (PST)
Date: Thu, 26 Nov 2020 18:37:38 +0100
From: Antoine Damhet <antoine.damhet@blade-group.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [DISCUSSION] Allow ACPI default OEM ID and OEM table ID fields
 to be set.
Message-ID: <20201126173738.iwrsrosnx2rzztp5@tartarus>
References: <20201125132711.jqb7znxu5jpoanwi@tartarus>
 <20201125133251.GI30079@redhat.com>
 <20201125110221-mutt-send-email-mst@kernel.org>
 <20201125201322.urze5b7vwaa2t5sy@tartarus>
 <20201126051838-mutt-send-email-mst@kernel.org>
 <20201126125012.x6yzsou5rmlxagli@tartarus>
 <20201126082606-mutt-send-email-mst@kernel.org>
 <20201126163450.knb55wh2u7k2qgbb@tartarus>
 <20201126120701-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201126120701-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=antoine.damhet@blade-group.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, lersek@redhat.com,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 12:09:13PM -0500, Michael S. Tsirkin wrote:
> On Thu, Nov 26, 2020 at 05:34:50PM +0100, Antoine Damhet wrote:
> > On Thu, Nov 26, 2020 at 08:29:41AM -0500, Michael S. Tsirkin wrote:
> > > On Thu, Nov 26, 2020 at 01:50:12PM +0100, Antoine Damhet wrote:
> > > > On Thu, Nov 26, 2020 at 06:09:11AM -0500, Michael S. Tsirkin wrote:
> > > > > On Wed, Nov 25, 2020 at 09:13:22PM +0100, Antoine Damhet wrote:
> > > > > > On Wed, Nov 25, 2020 at 11:04:55AM -0500, Michael S. Tsirkin wr=
ote:
> > > > > > > On Wed, Nov 25, 2020 at 01:32:51PM +0000, Richard W.M. Jones =
wrote:
> > > > > > > > On Wed, Nov 25, 2020 at 02:27:11PM +0100, Antoine Damhet wr=
ote:
> >=20
> > [...]
> >=20
> > > Exactly so I ask myself whether it's worth it, their next version
> > > will check CPUID and then where are we?
> >=20
> > Then I guess they will have to admit that they are purposefully blocking
> > VM use and it's not our problem anymore.
> >=20
> > > But maybe it's time we just changed all these IDs to e.g. QEMU.
> > > We are very far from bochs generated tables by now.
> >=20
> > That's a good idea, but I still think they should be user override-able
> > (unless you think it would be a heavy maintenance burden, in that case
> > you are king in your castle :D )
>=20
> Fundamentally there's a chance that if you get unlucky
> with your OEM ID some software somewhere will look for
> it and try to activate some vendor specific behaviour.
> So giving users full control here isn't all that safe ...
>=20
> Question btw, are you also supplying a SLIC table?

In production we do not, I've only toyed with adding a dummy table to
see if the `oem_id` and `oem_table_id` there were enough.

>=20
>=20
> > > Question is will this cause annoyances with e.g. windows guests?
> >=20
> > Windows 10 guests seems unaffected, I cannot say for the other
> > versions/servers editions.
> >=20
> > > Igor what's your experience with this?
> >=20
> > [...]
> >=20
> > --=20
> > Antoine 'xdbob' Damhet
>=20

--=20
Antoine 'xdbob' Damhet

