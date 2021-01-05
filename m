Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7AB2EAC60
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 14:54:56 +0100 (CET)
Received: from localhost ([::1]:42174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwmnX-0007bs-Ez
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 08:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kwmlV-00078Q-4J
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:52:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kwmlN-0006Vq-QX
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:52:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609854759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CSgV00Y6pIpqUM+xDxTUNhYLrDw22nT9xyjaRKWfHLI=;
 b=h3SkJGCXwjGZGRwkHNPFVsQCwxPNri/Ruj/ZH1NvMyO8u47sgM+c73AX+LkFD4qPen3bIz
 toe3GYZNadVTta5+UUyLtgewEb24t2qLJSmmunyg4xL4ps8vqxNSv9+ZDuMzRY18X/g5TX
 PX9fO8X8ktsJInaJKIX+cxbK9DKJfJE=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-I5GiHXENOrqyB2cx5xcsLQ-1; Tue, 05 Jan 2021 08:52:37 -0500
X-MC-Unique: I5GiHXENOrqyB2cx5xcsLQ-1
Received: by mail-vk1-f198.google.com with SMTP id f139so13747351vke.23
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 05:52:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CSgV00Y6pIpqUM+xDxTUNhYLrDw22nT9xyjaRKWfHLI=;
 b=eADvCQDiRWOFrmk6IZ+Uof2GMwe1vDdfceyR6/LTpL5bJDowqaVVf+bBAFafjt5+KX
 hNEnA/jlsE673m6YTuiBP7cQ8XlZPfndHVsXm95Fb1Hb67xQnNSxtgA+tBXiKq4Z3TFi
 gD7dHUrG7/SI7sSmQ/eCvJbFOP4/mgEYDP57B5ONYX4Ee1n+H/ZggGTLYkoAaSD5qwE4
 UVelrX0KZciqbhCXP1Ip2Dx7lncW2avL3vkl8pmXhr8thL1S6MXynpcWD3sYPxtHYFrG
 xm/wswuvmxFVXSaHVuH93iPxYACpjqz1/ZNtAQfC2G1D3bN8vTqxkVy0GVIAUjYBXuRc
 7Zyg==
X-Gm-Message-State: AOAM532uZMqwWvPtcgyR8ADBXhv0oHuMQK+Rbd1Ohy2h8VFUEII1nH5E
 q7xrM6Rr44X538ns9AT9gHB96oFsj8pq+ZlAarSmVRYyCmkRZ7awmnshZpuccqAEe7WbgD9Z53V
 t/LTc/LeUVHCYrRsBlseaQRxbfGSmuPo=
X-Received: by 2002:a05:6102:7d8:: with SMTP id
 y24mr47050528vsg.50.1609854757363; 
 Tue, 05 Jan 2021 05:52:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKAoUi66c4148tbXWakmiLWUAv+ht1s31MG5M82rbWJ5Tubc6dVqlQZo6xot4lYGFpp5+IIMLX4DT6Ob8tafs=
X-Received: by 2002:a05:6102:7d8:: with SMTP id
 y24mr47050513vsg.50.1609854757183; 
 Tue, 05 Jan 2021 05:52:37 -0800 (PST)
MIME-Version: 1.0
References: <20210105124405.15424-1-alex.bennee@linaro.org>
In-Reply-To: <20210105124405.15424-1-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 5 Jan 2021 10:52:26 -0300
Message-ID: <CAKJDGDagO4WO7fjC0oxd+Ed-qTg8GhDFk94x0Obu3tBaZMB2VQ@mail.gmail.com>
Subject: Re: [PATCH] tests/acceptance: bound the size of readline in
 s390_ccw_virtio
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 5, 2021 at 9:46 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> The read binary data as text via a PPM export of the frame buffer
> seems a bit sketchy and it did blow up in the real world when the
> assertion failed:
>
>   https://gitlab.com/qemu-project/qemu/-/jobs/943183183
>
> However short of cleaning up the test to be more binary focused at
> least limit the attempt to dump the whole file as hexified zeros in
> the logs.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/acceptance/machine_s390_ccw_virtio.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


