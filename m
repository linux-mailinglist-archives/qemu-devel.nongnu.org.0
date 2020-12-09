Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D952D498F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:56:08 +0100 (CET)
Received: from localhost ([::1]:34592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4dD-0002Mv-AK
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:56:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3sv-0002AW-P7
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3sr-00082P-0B
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FgcgZZzc2Flzw0fgzWTMsHtDenMVkVIL0C7rCd4lpNo=;
 b=LqY4z5IjQrLJM7uwTU0WB5lzY9XTc33oWvEkDVMDl5jSK2+hVysafUpbibPBvqrIJpgX5h
 y8eHtgVOkT6hc+pblqt34iItrDO1lK+H+SZTt8AV8jjNajLu7FysWWPZ4suCw+HPh4u6pt
 tG5z4lOvhieCJuFu4MqTVVA5yAD3pBo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-54zOus6LOrqY8nrNfWE7Wg-1; Wed, 09 Dec 2020 13:08:10 -0500
X-MC-Unique: 54zOus6LOrqY8nrNfWE7Wg-1
Received: by mail-wr1-f69.google.com with SMTP id o17so953345wra.8
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:08:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FgcgZZzc2Flzw0fgzWTMsHtDenMVkVIL0C7rCd4lpNo=;
 b=RDUHJGQK8X9PgdhWqRb8hekG2FbpqxuW1jVN2juPV7ryjfQs43gYPgiKmWvGjLLFuy
 Y7Qvap0OdK8eGdLomMfZnwUOpaA9fdVtypXq4LG1igATvE5EdEnzYAZViB7MTYnr+kG3
 nUn6gKExnNcWoZrITz77oV91aMP6Zm/7LjqKoP7BBKqhMeK70tAoSasvidWdhZ/r4S1k
 1icjpzfEMAQ7NTUIt/8xgFEtpGeKFFmI+JnAb5Fsl33wWfBY43LuAc8ZtaWv9VCTavN/
 RCXoMUh3omgXgcDlxW7gvio7Pqq8jYI6hI1AIKljNX0gogK76jT8O6aP1OZ2zfnGgpqu
 c1HQ==
X-Gm-Message-State: AOAM530943TlPWDT3ifXIY8HdYFCflOAa6LrAyKYFdx5+69ZMB8hzkfW
 hPrmg+9RaDOZw8oPh+EAwpqlKdlBtbiMSGny11y1o9LLxqewxc1gHxzSpLWBlIyIHBMPdsM2VRt
 AK53HDK6hWaWqFzXM2kCx0JsXkFeAgPrbQn86WyXRaPMTfq76xNLT30Fnkma5
X-Received: by 2002:a5d:4e04:: with SMTP id p4mr2694409wrt.373.1607537288919; 
 Wed, 09 Dec 2020 10:08:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfDnJtAWnvPNOFVoTtkOM23ClChhYwpK2Bn7IB9zw/K0fUq74nYOuIAOJ1DyBCVNW+SpvYxw==
X-Received: by 2002:a5d:4e04:: with SMTP id p4mr2694382wrt.373.1607537288758; 
 Wed, 09 Dec 2020 10:08:08 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id c9sm4919342wrp.73.2020.12.09.10.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:08:08 -0800 (PST)
Date: Wed, 9 Dec 2020 13:08:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 18/65] failover: Use always atomics for
 primary_should_be_hidden
Message-ID: <20201209180546.721296-19-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-4-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1011a524bf..a0fa63e7cb 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3136,7 +3136,7 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
         return false;
     }
     qdev_set_parent_bus(n->primary_dev, n->primary_bus, &error_abort);
-    n->primary_should_be_hidden = false;
+    qatomic_set(&n->primary_should_be_hidden, false);
     if (!qemu_opt_set_bool(n->primary_device_opts,
                            "partially_hotplugged", true, errp)) {
         return false;
-- 
MST


