Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BB944153E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:22:35 +0100 (CET)
Received: from localhost ([::1]:32968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhSaO-0003BK-MN
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhSZK-0002UD-4l
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:21:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhSZG-0007DT-JQ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:21:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635754881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CxOG9lw9+uOG5k8OxbcQPIozFZlIhjaiyIuxgZxK5vI=;
 b=cTNZhFdig5w2FrzPSoUZ6xDgQpF2qgLkPz2Im2kIeAHfR7/vMF2IvqWlL6FxG/EcALs0kb
 5woJGTvTHfpdYVcDxkmFt7RpQU64FZ/x5JgffA4G5gmy+Ts2/4Fxv6UB0kRPei6hTxzl7E
 /MqOb9GFKywthSA46dTG+XBQ6whKiEM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-QluosBjXM7GIyN6llUMqlw-1; Mon, 01 Nov 2021 04:21:19 -0400
X-MC-Unique: QluosBjXM7GIyN6llUMqlw-1
Received: by mail-qt1-f199.google.com with SMTP id
 o14-20020a05622a138e00b002a79da5b350so11481458qtk.15
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 01:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CxOG9lw9+uOG5k8OxbcQPIozFZlIhjaiyIuxgZxK5vI=;
 b=ntd1jDGARQ1NB9f8ktjsr8YsQxHtyv2eC5X0LwreUy9rbtSY53d7JGN8Qtl8oVjOyL
 AIYopmLSkQW4Sa/ZP5/wZAYGEpLGBco2L1oqsFznehsCXcQujyhSxNgMdR7oUOOGn1GW
 8vrWjYuTXg9VKmLeVk3wk+aHq6YmC8N+5MctmbDhrD7LDOncOcuEEgkM8tZ88FzQR3Fs
 fVOhP4bwnItTY8FPAOnuxMfKPQK1HVL5QY0fo4ZAqvDkC4LfkazQiLG9d/gzaNTuNLYI
 nn3rcpDyC/tKCUeHFsV03yiY8wzd4nBdh3zqX/vHvigWppraW0LmjM69NThDvh2+O4yE
 1m9Q==
X-Gm-Message-State: AOAM5319dLGrGFbyAf8a5QztfSspEPLFrxtiT5yE/BoHDM39KGpiTq5F
 wgo4Ft6E/BuqHxWbmF5u8/COzDKvwNUqcZwMDfcsTImqL986DBHrPMYFjoq9UaL9/C6T1XotOYC
 pH3RadoeEWYfQ8dtRRZFUesdwAy2gpWo=
X-Received: by 2002:a05:6214:226e:: with SMTP id
 gs14mr26815293qvb.4.1635754878983; 
 Mon, 01 Nov 2021 01:21:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUo6TY+uXdfRp1dQJ3yoTtceVLVpX2Y4WK81j/dvznZkmzNS2BipH7sEo9S7TRgZ3P4nhZizbTnRl1322viVg=
X-Received: by 2002:a05:6214:226e:: with SMTP id
 gs14mr26815279qvb.4.1635754878843; 
 Mon, 01 Nov 2021 01:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-2-eperezma@redhat.com>
 <87a6iprpfa.fsf@secure.mitica>
In-Reply-To: <87a6iprpfa.fsf@secure.mitica>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 1 Nov 2021 09:20:42 +0100
Message-ID: <CAJaqyWdKT+cSmteWPnvKu-e23Sv2zzCoQ97rit10pTcy2+udLA@mail.gmail.com>
Subject: Re: [RFC PATCH v5 01/26] util: Make some iova_tree parameters const
To: Juan Quintela <quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 31, 2021 at 7:59 PM Juan Quintela <quintela@redhat.com> wrote:
>
> Eugenio P=C3=A9rez <eperezma@redhat.com> wrote:
> > As qemu guidelines:
> > Unless a pointer is used to modify the pointed-to storage, give it the
> > "const" attribute.
> >
> > In the particular case of iova_tree_find it allows to enforce what is
> > requested by its comment, since the compiler would shout in case of
> > modifying or freeing the const-qualified returned pointer.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > Acked-by: Peter Xu <peterx@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> This patch can go in already, whose tree should this go through?
>

Hi Juan,

Sorry for being unclear, this patch has been already queued in
Bonzini's tree [1]. I included it here because it is still not in the
master branch.

Thanks!

[1] https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg03407.html

> Later, Juan.
>


