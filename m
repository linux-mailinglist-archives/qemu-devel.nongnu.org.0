Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECB26E6892
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 17:49:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ponYY-0001Sv-D1; Tue, 18 Apr 2023 11:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ponYW-0001SY-7K
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 11:47:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ponYU-0002tM-Oy
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 11:47:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681832862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgA7SCYbUqXy8bE9BJTIVUWFevlWjgQgtmRrXQEPNZ8=;
 b=bYn8aO3QAXO2eGZvaQhrG2jsWFlMBxTm5Mgn5KnoWbmpdEWL3A3JvfyxQe+jJ1YsQRM2iH
 +La08MWATw0FT4yw7CMfnfJUMD33b0mgL/wXY78jXk6v5KqdegqdZsK71zlraxI9mIl9/K
 wMR5eHWXpkCrWDBLOX4Q539qp5Thy0Q=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-qikr25qYNjCb_pgH1G9olw-1; Tue, 18 Apr 2023 11:47:38 -0400
X-MC-Unique: qikr25qYNjCb_pgH1G9olw-1
Received: by mail-yb1-f198.google.com with SMTP id
 d10-20020a25cd0a000000b00b956d4a5a04so1719743ybf.22
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 08:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681832858; x=1684424858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cgA7SCYbUqXy8bE9BJTIVUWFevlWjgQgtmRrXQEPNZ8=;
 b=WgPGD3DmqaV2VKUDfoGqNxBQSZXfFEIeBvpOzddkP2dg3OYGGr9f9WiDadsYP4hxuy
 haG1ySpJrdu2HB2KEXM4rUF+PnbmgAZdeo+diAWh2XfcfKodtKI1w8iP3WXFyUcqPXG4
 5fQtp0wHcDwKl2J+vQIH8rJEG8ppHRGebTvzyFGEvNqunwJ3hdfVmdYswtzbQEPKPms1
 2Gtei6W5pagXmVzunJ3MfvsPz07ooviHdMgsBo6AgwrWFFQ/+lvFRVPMU3Rd76LCMV7x
 2hEVbPSpX33+8vp80jSgnyNPZQw6JCFhpIgsppxiAsS7PuGrTSKUlfn/nm5MV9628Z7D
 Im0g==
X-Gm-Message-State: AAQBX9cNuzIPDlCjjVqnnRai7GU1IRC+bWnE7FRU0iK7eXTNxQ75jSFQ
 OvgspkU75TU4z0dje561eDNPdBAdDUiF+gjZty0iqCU5x3iJSMcvhr0ABhXlcBmIq9Ad4SF0O1J
 oA0zrhie9HV5whGi27Z1rQwdkYA/wmUE=
X-Received: by 2002:a81:8452:0:b0:54f:179:cef2 with SMTP id
 u79-20020a818452000000b0054f0179cef2mr308530ywf.19.1681832858017; 
 Tue, 18 Apr 2023 08:47:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZJodWHHbRcppaGKbIpFd8GNdB2m1ahU2eaiNdCAIRtj8Hd3OfY4z3OJHBIMw5Zf8dNuNzqXFmIVhrOnHxPeqM=
X-Received: by 2002:a81:8452:0:b0:54f:179:cef2 with SMTP id
 u79-20020a818452000000b0054f0179cef2mr308515ywf.19.1681832857792; Tue, 18 Apr
 2023 08:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230418151811.GA4048149@fedora>
In-Reply-To: <20230418151811.GA4048149@fedora>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 18 Apr 2023 17:47:01 +0200
Message-ID: <CAJaqyWfFoba+pijeO__iXYjV3Z3SRORgTVFR7aNWEA_28gp3Xw@mail.gmail.com>
Subject: Re: Move vhost-user SET_STATUS 0 after get vring base?
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>, Yajun Wu <yajunw@nvidia.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 18, 2023 at 5:18=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.co=
m> wrote:
>
> Hi,
> Cindy's commit ca71db438bdc ("vhost: implement vhost_dev_start method")
> added SET_STATUS calls to vhost_dev_start() and vhost_dev_stop() for all
> vhost backends.
>
> Eugenio's commit c3716f260bff ("vdpa: move vhost reset after get vring
> base") deferred the SET_STATUS 0 call in vhost_dev_stop() until after
> GET_VRING_BASE for vDPA only. In that commit Eugenio said, "A patch to
> make vhost_user_dev_start more similar to vdpa is desirable, but it can
> be added on top".
>
> I agree and think it's a good idea to keep the vhost backends in sync
> where possible.
>
> vhost-user still has the old behavior where QEMU sends SET_STATUS 0
> before GET_VRING_BASE. Most existing vhost-user backends don't implement
> the SET_STATUS message, so I think no one has tripped over this yet.
>

My bet is that those backends simply do not migrate so they don't hit
it. But maybe those backends return -1 for GET_VRING_BASE and use
split vq, so it can be fetched from guest's used idx?

> Any thoughts on making vhost-user behave like vDPA here?
>

I guess the first step should be to gather a list of backends that use
SET_STATUS and are interested in migration. But in my opinion the
current behavior can be considered a bug and it is unlikely that it is
implemented properly there.

* If they ignore the set_status, we can totally reorder the order and
it will be the same.
* If they always return an error for GET_VRING_BASE then they will
keep it returning, so no harm here either.
* If they use more complicated logic like "return -1 for
GET_VRING_BASE as long as the device is not DRIVER_OK". Improving the
situation in this case.

Thanks!


