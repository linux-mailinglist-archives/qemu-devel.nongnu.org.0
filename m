Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902742D93B3
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 08:48:19 +0100 (CET)
Received: from localhost ([::1]:46768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koiag-0004YC-4O
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 02:48:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1koiYZ-0003Bm-NY; Mon, 14 Dec 2020 02:46:07 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1koiYX-0006l5-Rr; Mon, 14 Dec 2020 02:46:07 -0500
Received: by mail-wr1-x42c.google.com with SMTP id a11so7664135wrr.13;
 Sun, 13 Dec 2020 23:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=7CLvZWlJGE9pAbmF1ZeVYqzKa4QzcerK0aitwu3LRYA=;
 b=jLOYyiw7BE4Nml9SAwuHRbX77K8ATp5KM8rg8TWHBoiM6Xcz3Nq42GqrBUgJdHn82c
 q7s/9NFh96P6pnGgmpcBWTo9rDXnCqiwbB97RJjEP11JfqEpzYUV/ioqShXNmrlz/vwo
 xD4SCySmndb6kow6jKi4h+88o+ut3dvlXeXwxRSoggJenIfH7uGAH3O+fibgOEPYUhff
 kqc3so27WcWHDj9I5RNUeNEb5aBn4wDwwA4dhDtKGGybK3/vsai8ZlvMRI9ZnXYPJiKv
 SuEiadp6qV2s6HxLqm6kP/ORdMnoU+PpT2Km8RbLrFEe76cfa4s6trQh23aoYy55+nkr
 SIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=7CLvZWlJGE9pAbmF1ZeVYqzKa4QzcerK0aitwu3LRYA=;
 b=fr60CN384A51e4ugFBvenUq/sd4+4btBPXLKYzb6PtmXRGL85SWe82yxhcpv6chS2p
 QTobolyzY+l7+mkoYzY0F2Yij+DYytrk8fGtjq2KZ2k3VaN7WR3ClVY7E7UYOpLNS0t9
 3Lf6ZG1FKXHa7DpKvPPokAGm/yyBWKB6/1hGnyooIVocYGjfxOgkP6IlitopIKskII+g
 WRxOmHeOVtixFXeDhU7VPW+hDOmUR+JZGTgRQBEJYN+nt+GHVqLDYCbR9Sjg9C+Z9/u6
 Z5lfTkfd4aLIcE6HFsGgYbwi5o1mgs0rIMrp9cJMAim47W5uAqO4WoYPfp1I4tUSCFxL
 1DgA==
X-Gm-Message-State: AOAM531sC8joAU5bZZa5PkxIz8l3aq6HlUot1+RERd8VXXSJcttgBtso
 us9IA5CiMa6RCrQ5sTYZHvc=
X-Google-Smtp-Source: ABdhPJxNeGQl/cu2GYjlWH7t8lH884fbYLCIL+vwErYrctSCVkJrX7E48+6a7CHyHCMcluRZXgBEzg==
X-Received: by 2002:a5d:6607:: with SMTP id n7mr24256141wru.206.1607931963536; 
 Sun, 13 Dec 2020 23:46:03 -0800 (PST)
Received: from CBGR90WXYV0
 (host109-146-187-221.range109-146.btcentralplus.com. [109.146.187.221])
 by smtp.gmail.com with ESMTPSA id h9sm29004797wre.24.2020.12.13.23.46.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 13 Dec 2020 23:46:02 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Eduardo Habkost'" <ehabkost@redhat.com>,
	<qemu-devel@nongnu.org>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-10-ehabkost@redhat.com>
In-Reply-To: <20201211220529.2290218-10-ehabkost@redhat.com>
Subject: RE: [PATCH v4 09/32] qdev: Make qdev_get_prop_ptr() get Object* arg
Date: Mon, 14 Dec 2020 07:46:03 -0000
Message-ID: <009b01d6d1ed$2d415900$87c40b00$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLXjZRr+qbM/S7ZJ9VMMfP1SWcevwM8aMtWp9rbvdA=
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Cc: 'Matthew Rosato' <mjrosato@linux.ibm.com>,
 'David Hildenbrand' <david@redhat.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org, 'Stefan Berger' <stefanb@linux.vnet.ibm.com>,
 'Markus Armbruster' <armbru@redhat.com>, 'Halil Pasic' <pasic@linux.ibm.com>,
 'Christian Borntraeger' <borntraeger@de.ibm.com>,
 'Anthony Perard' <anthony.perard@citrix.com>,
 =?UTF-8?Q?'Marc-Andr=C3=A9_Lureau'?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
 'Thomas Huth' <thuth@redhat.com>,
 'Alex Williamson' <alex.williamson@redhat.com>,
 'Igor Mammedov' <imammedo@redhat.com>, 'John Snow' <jsnow@redhat.com>,
 'Richard Henderson' <rth@twiddle.net>, 'Kevin Wolf' <kwolf@redhat.com>,
 "'Daniel P. Berrange'" <berrange@redhat.com>,
 'Cornelia Huck' <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 'Max Reitz' <mreitz@redhat.com>, 'Paolo Bonzini' <pbonzini@redhat.com>,
 'Stefan Berger' <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Eduardo Habkost <ehabkost@redhat.com>
> Sent: 11 December 2020 22:05
> To: qemu-devel@nongnu.org
> Cc: Markus Armbruster <armbru@redhat.com>; Igor Mammedov =
<imammedo@redhat.com>; Stefan Berger
> <stefanb@linux.ibm.com>; Marc-Andr=C3=A9 Lureau =
<marcandre.lureau@redhat.com>; Daniel P. Berrange
> <berrange@redhat.com>; Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com>; John Snow <jsnow@redhat.com>; Kevin
> Wolf <kwolf@redhat.com>; Eric Blake <eblake@redhat.com>; Paolo Bonzini =
<pbonzini@redhat.com>; Cornelia
> Huck <cohuck@redhat.com>; Stefan Berger <stefanb@linux.vnet.ibm.com>; =
Stefano Stabellini
> <sstabellini@kernel.org>; Anthony Perard <anthony.perard@citrix.com>; =
Paul Durrant <paul@xen.org>; Max
> Reitz <mreitz@redhat.com>; Thomas Huth <thuth@redhat.com>; Richard =
Henderson <rth@twiddle.net>; David
> Hildenbrand <david@redhat.com>; Halil Pasic <pasic@linux.ibm.com>; =
Christian Borntraeger
> <borntraeger@de.ibm.com>; Matthew Rosato <mjrosato@linux.ibm.com>; =
Alex Williamson
> <alex.williamson@redhat.com>; xen-devel@lists.xenproject.org; =
qemu-block@nongnu.org; qemu-
> s390x@nongnu.org
> Subject: [PATCH v4 09/32] qdev: Make qdev_get_prop_ptr() get Object* =
arg
>=20
> Make the code more generic and not specific to TYPE_DEVICE.
>=20
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com> #s390 parts
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Xen parts...

Acked-by: Paul Durrant <paul@xen.org>


