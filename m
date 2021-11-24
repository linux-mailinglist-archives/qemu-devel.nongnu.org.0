Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311A045C719
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 15:18:17 +0100 (CET)
Received: from localhost ([::1]:37500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpt6F-0002a1-PU
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 09:18:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mpt4Z-0001Kc-8q
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:16:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mpt4Q-0004GG-BU
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:16:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637763379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=dogncq9hSjpNxZwTIPuDjCwfWR4EHAJpDQhDxTJ3I7Q=;
 b=SY2LEJ+frhdrrQhWS9OHj8Pp+wmSYeicKFHXC76G0CBvH62JbZLefhNUckNOUd21VEpYgx
 8ecHG0QIt3ElKqqCdBKlYZg7GRuo/IiKoS9OtV8FZo4ZvAb4pf7F28QjA9czfr6AKZpL/+
 ipDqMquJkz2Y0Mf7E0E+1p0m952ku5w=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-8Ih8xWuCNEGGSCbMKGYrew-1; Wed, 24 Nov 2021 09:16:16 -0500
X-MC-Unique: 8Ih8xWuCNEGGSCbMKGYrew-1
Received: by mail-vk1-f200.google.com with SMTP id
 x132-20020a1f7c8a000000b002f59112b3d5so1780357vkc.0
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 06:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=dogncq9hSjpNxZwTIPuDjCwfWR4EHAJpDQhDxTJ3I7Q=;
 b=TTHOreHSOLysPlKaIhASSs+myq5J3H+lFx0B1TYCn92Whoby9aZ25zsOo8bECZUR/f
 bQnPOuDj8dCatppihJVmJyqXcgiVNS8UtxN6y6oBUfMiC/CiMQqAl1fJ3+GxrBahN4MS
 xdTFb8JMGx7iMT/VFdFvN2vQT5j5O3K/+vL+hfchSuec/lMyWXd3Rq3q5GHdWRo+uiuR
 0ZPct3FJ3A972WoYxNAsM4z4uFMbWaFqG7tNyuMqBOXtbSfCZGvKIlxTEVYg4WS+YdMW
 tCQIgG75iN1NP91cs+YWBB3tMCd367o3SfWKapvP9XzH86WHoSkE+jPkIaAFyO7nPmfb
 6G9g==
X-Gm-Message-State: AOAM533Wwu9jPW7iMCU4TxGxEeVoc8QRKUmLSAPXFvfu0VVoi9z2a89q
 YOJ0+h+yfaFsXqs0LouA5xzvuzIvJw1vxY/C4530A1AKAenYL98ncZNWqzkJuBmv4p2nSO2+3uF
 qFqI5FPyX2Pa05itkJ/Yjs9mN3UmuXuY=
X-Received: by 2002:ab0:7399:: with SMTP id l25mr11040619uap.120.1637763376028; 
 Wed, 24 Nov 2021 06:16:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrGuTfpNWCeAXEKKrsvNPdZxW3bprtuYYm4Jsgw5i73P9vOHHXJ30M7WSlw067ApQ9cAUKKSOO0rdtn4aXDPw=
X-Received: by 2002:ab0:7399:: with SMTP id l25mr11040576uap.120.1637763375825; 
 Wed, 24 Nov 2021 06:16:15 -0800 (PST)
MIME-Version: 1.0
From: Cleber Rosa <crosa@redhat.com>
Date: Wed, 24 Nov 2021 09:16:05 -0500
Message-ID: <CA+bd_6JS0t_COHiw2Y3Ej1gAeOGVTScNoS-=Seo+7udAe5wqZw@mail.gmail.com>
Subject: Give the fosshost.org VM a purpose or a retirement
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Fosshost.org was kind enough to supply the QEMU project with a public
VM hosted by them.  The original use case we anticipated was to set up
a GitLab CI runner, because we assumed the VM was KVM capable, but
that turned out not to be the case.

So, at this point, adding it as a GitLab CI runner would not add any
significant improvement over the shared runners already provided, and
it would require more maintenance effort.

If there are any ideas for making use of this resource, and volunteers
to configure and maintain it, please let me know.

Otherwise, it seems fair to relinquish the resource back to Fosshost.org.

This is also related to: https://gitlab.com/qemu-project/qemu-web/-/issues/2

Thanks,
- Cleber.


