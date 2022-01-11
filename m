Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4B248AC46
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 12:18:08 +0100 (CET)
Received: from localhost ([::1]:42670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7FAG-000813-2x
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 06:18:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1n7F7f-0006jQ-Dw
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:15:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1n7F7d-0003Tf-3q
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641899723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ci8xuWfmyUcXejaPsmnuaPncsOrCcxKoPB6HQViyl9U=;
 b=KxUhQMQKH0l26wmiuXpdUwm6ONNOO4hPeQ6eI0lKluIpUXGKVi7OhCUSNFUW3PICqAzQfQ
 GS+aV1QrtpAlX9HxA3ajFYgp6Ty7xMPjMQIU0roLNNUdGDEW5fW1qFwiXvFo+vvZZ0/bbY
 gcACNBLBWlHZkEm9LPYjavXvkV5Q9iQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-wKsI6xJYOOKp7m2fplpTCw-1; Tue, 11 Jan 2022 06:15:22 -0500
X-MC-Unique: wKsI6xJYOOKp7m2fplpTCw-1
Received: by mail-qk1-f198.google.com with SMTP id
 q5-20020a05620a0d8500b004738c1b48beso10445586qkl.7
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 03:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ci8xuWfmyUcXejaPsmnuaPncsOrCcxKoPB6HQViyl9U=;
 b=x5cAzQi73RV2YUnAH3Dfmu76U6+aqUkhOjPJa/AR/s61yBfXOnKmsM28CP5eeZzxE9
 lF035TobruLINFX+QGKeNHW63zMmt5mnql28oM0g455QI4VxfrbL0BoJQHfbxwVp1bhK
 Vljkl+3AhlY6wY2qc1QqJhcxly/ON8pMMNTqBoQ7ZdrYQq4gJ243Ot+kSckRQleD74yS
 L/mD2umclLNPvWNzoLFhHVaaWYb+MHzpL8VUMJDPl2z7PaYQGOtVU4Lt6ZwGcQvLQ/9v
 fWCV6GlvNGOeQG+99T3q1KEgj2XvRSJej5Gpnx4RVZZNRkBpJSVureunPx/IRnLc8A+D
 f2ew==
X-Gm-Message-State: AOAM53366kfyWx68YyPvOVfaFWbtepCZnhGe1kIR+faNt2wPOe7wC9D0
 DKzvaEOQbCLaSm8F5ScnXPvLV/X64Gjj7iFTFcyG4OrOtBqhaHbSXsY54Z5eyhC/2p8oxVrH59p
 k+40ozho3excEQBU=
X-Received: by 2002:a05:622a:1883:: with SMTP id
 v3mr1524531qtc.682.1641899721369; 
 Tue, 11 Jan 2022 03:15:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNx0i2wfcp6eMb5LvYjozmBK7liV9Sqal44SsYcAhZ+LRwV8DUmASZgNvDy2J+v1CplhZL3A==
X-Received: by 2002:a05:622a:1883:: with SMTP id
 v3mr1524512qtc.682.1641899721189; 
 Tue, 11 Jan 2022 03:15:21 -0800 (PST)
Received: from steredhat (host-79-51-11-180.retail.telecomitalia.it.
 [79.51.11.180])
 by smtp.gmail.com with ESMTPSA id s27sm7338484qtc.0.2022.01.11.03.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 03:15:20 -0800 (PST)
Date: Tue, 11 Jan 2022 12:15:14 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH 2/2] block/rbd: workaround for ceph issue #53784
Message-ID: <20220111111514.bu4dtcg43uf7zc22@steredhat>
References: <20220110114154.3774072-1-pl@kamp.de>
 <20220110114154.3774072-3-pl@kamp.de>
 <20220110141854.6wqqfyrsjyehcxqp@steredhat>
 <7b5029ab-fa80-b1ed-63b9-9efd2d0284e3@kamp.de>
MIME-Version: 1.0
In-Reply-To: <7b5029ab-fa80-b1ed-63b9-9efd2d0284e3@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 ct@flyingcircus.io, qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, pbonzini@redhat.com, idryomov@gmail.com,
 idryomov@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On Tue, Jan 11, 2022 at 10:10:16AM +0100, Peter Lieven wrote:
>Hi Stefano,
>
>
>thanks for the feedback. Please note that you also need the other patch 
>or you will sooner or later run into another assertion as soon as rbd 
>snapshots are involved.

Yep, I tested with the entire series applied.
Anyway, thanks for clarifying that.

>
>Regarding the workaround I need confirmation from Ilya that it covers 
>all cases. I do not know if it works if striping or EC is configured on 
>the pool.

Sure :-)

Thanks,
Stefano


