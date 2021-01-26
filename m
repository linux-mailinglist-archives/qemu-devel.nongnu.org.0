Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4829C303803
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 09:37:43 +0100 (CET)
Received: from localhost ([::1]:35904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Jr4-0002PI-Cm
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 03:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1l4Jpt-0001p2-Rj
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 03:36:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1l4Jpq-0003Dm-Ow
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 03:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611650183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ouRLIPZ5j/dQrsLo0MMLkDtSE9QiRZCalHZiZWDiaE=;
 b=flZFhuO4v/gvucyGbd6kwbk7/KKTfMZM1x7sqiZeS32tqCf3+GLgEj8iyvPL9/AYpeCiWr
 83knV5jEtAFR5hw4DIdWVxD+0RX6pm9ZKbhzZNF1kUCSSd4s19ZE6cOMhK0eq9+Ix4UK8s
 ol9TvLDsBh7dDGipZDulTsIVJ21JVLw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-mJGxGjsUOQe4JtLCgFmZWA-1; Tue, 26 Jan 2021 03:36:21 -0500
X-MC-Unique: mJGxGjsUOQe4JtLCgFmZWA-1
Received: by mail-ej1-f72.google.com with SMTP id z2so4702601ejf.3
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 00:36:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1ouRLIPZ5j/dQrsLo0MMLkDtSE9QiRZCalHZiZWDiaE=;
 b=AxrVTG14c0iSk3H6NFRnDEHglOXkJ0kFkUcTKi/MtEGjlesIMxT18Dnixr2Vor4TLa
 20JZ/3GaTRCSdl7yBBZsfCQ8E5SfIkG4HqAFDzqcRjA5irAoH35LKdRwIEapHXsi2tWh
 bORyoKU6lthR0cW9O7Q0BWINdw3k43ZGNk4MvWElpXlXrinViV1I90QyNyRg/7/87YkD
 EFC11gAs2mjvQcuPcYCis/B8GfcOKgVbHJLvwK77Gb7n0/BihB5nKfbYhiFcy7EtQzr+
 WrbsLfa3zVx2Y6qGR78dCxbmSsRjS7h2SxJNktFiCWbgF2XudAcBxH6Zq3zn2iXrZuqD
 JTAg==
X-Gm-Message-State: AOAM532+H3lsw/c2a3O2mVAFLUNHj0OVNloX6NG9TNEAn1KFBEsglm7W
 ONmXLNaSGCfEbHhNnjew+x26VI/bvj0udTJRnMa4prYSOwYBqf51KRtMSE0yowkR/TNelSnYhtV
 Qfjf5hMJ3XLRsusAZux0yRO+kqyc7snc=
X-Received: by 2002:a17:906:3885:: with SMTP id
 q5mr2819462ejd.105.1611650180142; 
 Tue, 26 Jan 2021 00:36:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxf1oywIsjrJJcAuDbVQ0xfG3zhKHAv7H35Syr2ndw1Qvgs8ATKXPoMlQ4Od27hxY4RiFiswLskkvHwgRajQrQ=
X-Received: by 2002:a17:906:3885:: with SMTP id
 q5mr2819448ejd.105.1611650179928; 
 Tue, 26 Jan 2021 00:36:19 -0800 (PST)
MIME-Version: 1.0
References: <20201224175441.67538-1-mcascell@redhat.com>
 <CAA8xKjWf8HBj6qgZ8iJTW0hbU8D6QKcycxT-hBo8=HG3TD36NQ@mail.gmail.com>
 <769d08e0-1da8-f281-65ec-f7d085b850f0@redhat.com>
In-Reply-To: <769d08e0-1da8-f281-65ec-f7d085b850f0@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Tue, 26 Jan 2021 09:36:09 +0100
Message-ID: <CAA8xKjWJ_37ha6U9vz62o83i-L2MdE=Bz_XNevQGpAdcd8xWvg@mail.gmail.com>
Subject: Re: [PATCH] hw/scsi/megasas: check for NULL frame in
 megasas_command_cancelled()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, cwmyung@snu.ac.kr, Hannes Reinecke <hare@suse.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 25, 2021 at 3:52 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> You forgot to Cc the subsystem maintainers...
>
> ./scripts/get_maintainer.pl -f hw/scsi/megasas.c
> Hannes Reinecke <hare@suse.com> (supporter:megasas)
> Paolo Bonzini <pbonzini@redhat.com> (supporter:SCSI)
> Fam Zheng <fam@euphon.net> (reviewer:SCSI)

I used to only check the MAINTAINERS file, which only mentions Hannes
in connection with megasas. Good to know for the nex time.

> As Paolo usually asks for reproducer to be integrated with the fix,
> it might save him/you time if you respin with the reproducer. You
> can have a look at
> https://www.mail-archive.com/qemu-block@nongnu.org/msg78982.html
> for example.

Thank you for the heads up, Philippe. I'll try to incorporate the reproduce=
r.

> That said, unrelated to your patch but I'm not sure how useful it
> is to test for bugs found by fuzzer each time in our CI. There are
> borderline cases not representing proper use. Maybe we could run
> them weekly instead...

--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


