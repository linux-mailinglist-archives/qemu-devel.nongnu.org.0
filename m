Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCFB2D93B5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 08:49:12 +0100 (CET)
Received: from localhost ([::1]:49180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koibX-0005Vv-H4
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 02:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1koiZs-0004Bj-Aq; Mon, 14 Dec 2020 02:47:28 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1koiZq-0006qS-Fh; Mon, 14 Dec 2020 02:47:28 -0500
Received: by mail-wm1-x32c.google.com with SMTP id a3so14324797wmb.5;
 Sun, 13 Dec 2020 23:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=q9f0dLrgKME11QwP+Lz1f8G042/xNt7QORwsmse8W30=;
 b=Z8fdp8uibo5J7i6A5eXX0hVDeL/FKch5Y6Uz+fhYFztuVApB2vT3A+AIAZzChqJFLn
 Br84u47JhMVvg4OeLycAsmc4zEXKi4lOhMxbJbb005dTFLs7u1a4e5+PwJQh2jFqiOBY
 22aFebb+8xibP+rQonKnqKDLB6jSK48r7YcDlzZJFLrLdUOB2mVMQLznYW/1swZjE4NP
 tqMfb290URo2+yTH+n6CMeBpO610UsNIPvTifnY76RjBoAC7teDOHURK0r8PjqwRUmfv
 zmooEKMqub62XwLcdV1s91g+zy19S3lqMBRY6q3rgTMEwF2Fc8NrDo/9uwACGqhiHYOh
 VrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=q9f0dLrgKME11QwP+Lz1f8G042/xNt7QORwsmse8W30=;
 b=iOnz3imGNK7n6EzXKnaC/OWATlrxekeRH3QNetvxcW1V9YuLRVpkx+MEPfKcZauQmE
 rXOg2VtJNFVeDeLwJ1adQGYsYqxV5alpmSfneffQUEF86SReySu1xvC3F0aEClGdHpGi
 l4fwk37oybyZcyohFQbzztCiKBNoQQqXZypiKwlutL1P2ULY2wnyhMMbL2taUIm49jg4
 zRAFTNjjHizAq+3Juo8gc7hCdPxzmnYBMcBU7Egtf6GIQNpr1b63dSfCuDUPntHCj63z
 srRNLrWlA8kGrLjgPxkKX0vjnkC/uKxeft9T2xVKI+gRelrK+/KaS/BsbvU9CBA89a3G
 d6Fg==
X-Gm-Message-State: AOAM533tGAFrv2iBhXHlTOLmRb8UuZO1Qn9YOO+QHsM/6D/bvIRODllt
 67cx3dx9nxnxT7Hra4JzZ0M=
X-Google-Smtp-Source: ABdhPJzu+zNeTRFRPazIHL+E4xY5IryYTfv2xhHMgRDdh02X4K6G7ujVJ7rk339hArcq0uo/hSscZw==
X-Received: by 2002:a7b:c145:: with SMTP id z5mr26334263wmi.164.1607932044358; 
 Sun, 13 Dec 2020 23:47:24 -0800 (PST)
Received: from CBGR90WXYV0
 (host109-146-187-221.range109-146.btcentralplus.com. [109.146.187.221])
 by smtp.gmail.com with ESMTPSA id x66sm27844024wmg.26.2020.12.13.23.47.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 13 Dec 2020 23:47:23 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Eduardo Habkost'" <ehabkost@redhat.com>,
	<qemu-devel@nongnu.org>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-31-ehabkost@redhat.com>
In-Reply-To: <20201211220529.2290218-31-ehabkost@redhat.com>
Subject: RE: [PATCH v4 30/32] qdev: Rename qdev_get_prop_ptr() to
 object_field_prop_ptr()
Date: Mon, 14 Dec 2020 07:47:25 -0000
Message-ID: <009d01d6d1ed$5da99ee0$18fcdca0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLXjZRr+qbM/S7ZJ9VMMfP1SWcevwIpMTjHp+N10QA=
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32c.google.com
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
<pbonzini@redhat.com>; Stefan
> Berger <stefanb@linux.vnet.ibm.com>; Stefano Stabellini =
<sstabellini@kernel.org>; Anthony Perard
> <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>; Max Reitz =
<mreitz@redhat.com>; Cornelia Huck
> <cohuck@redhat.com>; Halil Pasic <pasic@linux.ibm.com>; Christian =
Borntraeger
> <borntraeger@de.ibm.com>; Richard Henderson <rth@twiddle.net>; David =
Hildenbrand <david@redhat.com>;
> Thomas Huth <thuth@redhat.com>; Matthew Rosato =
<mjrosato@linux.ibm.com>; Alex Williamson
> <alex.williamson@redhat.com>; xen-devel@lists.xenproject.org; =
qemu-block@nongnu.org; qemu-
> s390x@nongnu.org
> Subject: [PATCH v4 30/32] qdev: Rename qdev_get_prop_ptr() to =
object_field_prop_ptr()
>=20
> The function will be moved to common QOM code, as it is not
> specific to TYPE_DEVICE anymore.
>=20
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Xen parts...

Acked-by: Paul Durrant <paul@xen.org>


