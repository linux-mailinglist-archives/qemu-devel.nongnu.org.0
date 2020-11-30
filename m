Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050432C80D6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 10:22:12 +0100 (CET)
Received: from localhost ([::1]:52960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjfNr-0003Ag-2G
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 04:22:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1kjfMT-0001x9-Iq
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:20:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1kjfMQ-0006W0-FE
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606728041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YdSdzBxtL9KNNvsbfzDEfBrjVuTVx1/14Z3DvFfZ4EM=;
 b=WeruAnVeKejzyHxuv0kq4hclV1FcXT39Z6zc90sqcvXJauLku+d4hi5ttYz4Sq6FXlpXi0
 +uFsV3dak9144GTDGaykkvV3qUk95Q9o9JGKz+9UZDlp7FQNL4KJLzd2TK/oh6G96JE2ym
 0L3u33w2QIp3rKEPbXS5aJCjBJMRZu8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-9P4Oggw4MWyM1FF_qtBz7g-1; Mon, 30 Nov 2020 04:20:38 -0500
X-MC-Unique: 9P4Oggw4MWyM1FF_qtBz7g-1
Received: by mail-ej1-f70.google.com with SMTP id p18so5437368ejl.14
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 01:20:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YdSdzBxtL9KNNvsbfzDEfBrjVuTVx1/14Z3DvFfZ4EM=;
 b=BYGRPYgjNYLT2bk9Cfc2Mdy6JOj4w2Y+9M4wCLV7wiprx6kbscyG/4i1onSBbqELBG
 AiX6Yi+j9PlwSXj/ofTGkiHho/iDZJcBVTYZWUk/tVibDA2sYj+pDnOA0MQNUWO56+G8
 8Qp/mHxxR16YxqNos9Vk1LdT4aTWS6QIBmbcR9m77q0YAUTa1QekZZ2albKcDhzwv29v
 uKIvTjUgq0jwe91PqidqiywdAvihfLcwR+ZvbY7HtjxVeSH+7+ZG154HuTQ3nsKDJ6DX
 GNoicz0uQ/mfzwwyu0kxfgvP+u6e63Oxq1wJk4EUgqlSlxaLKgAdJiywp/y/Pioh4N2I
 dFtQ==
X-Gm-Message-State: AOAM532rY+UMfGTGDH5AFbrw9VYYDVFHaMoFWWfRU9bUFxrdM7xmqz4A
 Kmrpk/Q1fNHTQCz3eghXSF0yXbZX55VCAACpm5M5A80s8MXAKrtGbx5FBhylnc01FBIj5eZTjMo
 LvmjaHMGp2JXrVIVD0ww5Zp7s6TbD6OY=
X-Received: by 2002:a17:906:c345:: with SMTP id
 ci5mr12423680ejb.492.1606728037201; 
 Mon, 30 Nov 2020 01:20:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrvWy3L1lEo+gw1mbsA0eazZgeaaqLWVnfaYzG/0F6gOa4ZP08Y+gfIhqu+aeEQZQPPxu7SEBuxu8ahV15etk=
X-Received: by 2002:a17:906:c345:: with SMTP id
 ci5mr12423656ejb.492.1606728036960; 
 Mon, 30 Nov 2020 01:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20201127154524.1902024-1-philmd@redhat.com>
 <20201127154524.1902024-2-philmd@redhat.com>
 <733cc7a3-bbf8-7462-cbeb-34dd1229532e@redhat.com>
In-Reply-To: <733cc7a3-bbf8-7462-cbeb-34dd1229532e@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Mon, 30 Nov 2020 10:20:26 +0100
Message-ID: <CAA8xKjVg6E3zPzQ2PMP7OVNNUG6_2v_JsL_4vsGnkDfUTGmihw@mail.gmail.com>
Subject: Re: [RFC PATCH-for-5.2 1/2] net: Do not accept packets bigger then
 NET_BUFSIZE
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Mon, Nov 30, 2020 at 3:36 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2020/11/27 =E4=B8=8B=E5=8D=8811:45, Philippe Mathieu-Daud=C3=A9 wrote:
> > Do not allow qemu_send_packet*() and qemu_net_queue_send()
> > functions to accept packets bigger then NET_BUFSIZE.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> > We have to put a limit somewhere. NET_BUFSIZE is defined as:
> >
> >   /* Maximum GSO packet size (64k) plus plenty of room for
> >    * the ethernet and virtio_net headers
> >    */
> >   #define NET_BUFSIZE (4096 + 65536)
> >
> > If we do want to accept bigger packets (i.e. multiple GSO packets
> > in a IOV), we could use INT32_MAX as limit...
>
>
> This looks like a complaint for:
>
> commit 25c01bd19d0e4b66f357618aeefda1ef7a41e21a
> Author: Jason Wang <jasowang@redhat.com>
> Date:   Tue Dec 4 11:53:43 2018 +0800
>
>      net: drop too large packet early
>
> which only fixes the iov version of the function.
>
> If you don't see any real bug, I suggest to merge the fix in next release=
.
>
> Thanks
>
>

Following is the reference bug along with a proposed patch, although I
guess the patch [2] is not strictly required once this patchset is
merged.

[1] https://bugzilla.redhat.com/show_bug.cgi?id=3D1899722
[2] https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg05935.html

Thank you,
--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


