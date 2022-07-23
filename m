Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1099F57EF16
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 13:51:03 +0200 (CEST)
Received: from localhost ([::1]:45440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFDev-0007qS-Kh
	for lists+qemu-devel@lfdr.de; Sat, 23 Jul 2022 07:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oFDcm-00067C-SU
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 07:48:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oFDcj-0002nS-5d
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 07:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658576924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AY9izIEA+i/8mW4u3fLki0o5kLFWD14vb9W5dcTIdWs=;
 b=VpRDrGRDeRDr8oKVlpZsrzSEDc40KaMhPO7HM6yXudKcXvAi0hEIyzceBUZHL+M7pGm7/K
 iBnyBaHkdtaqb3/MHbc6eCF+zJODim4TB70HCfaFhLMbBGfDZn4V3dcjZTnXnYxx4StUJs
 LV0VqeJHGZmOp52I2tDOOH5LWBz5T0o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-ZdrpScDROCWdY03dmjEvLA-1; Sat, 23 Jul 2022 07:48:42 -0400
X-MC-Unique: ZdrpScDROCWdY03dmjEvLA-1
Received: by mail-ed1-f71.google.com with SMTP id
 dz20-20020a0564021d5400b0043be2c5cd32so276942edb.2
 for <qemu-devel@nongnu.org>; Sat, 23 Jul 2022 04:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AY9izIEA+i/8mW4u3fLki0o5kLFWD14vb9W5dcTIdWs=;
 b=yyPxR+mxRNXeg266EW2w6b0TYT0KQ2HL9w+NycHqeJx+GFkFi/SF3gRKlMgkZo1cX0
 3QVy8rvQKxUoiS2StEA+sGzRxWq9Srj7z8eygGbF6odpzdJlv3rKY/1j/xeWiXjf4Jfv
 6Sy/hIq+37JarK0T0zFBiIPNdJJKLUL33JD97QqZDp1zul7AvIdFRwBbWLfAvhrkaH54
 NghNNLMQiz5HfHB4eCEEF5qXUy86lSPlkYJdn16DfmLKRxiHX8yDr5sH810bDyYDkIch
 GaEwUpg+MU2SVePohYBkRBIJuHNEpmI+iLjDHPhURcLAfxQmqMjLXyHB8iMKWNyfgLOf
 EPRQ==
X-Gm-Message-State: AJIora9rRo1R8jXxTpNusjm/T8PjpKHE8pI6lcXqarVBtYjhnTuDMECs
 YxLmFrz1lwwNnpzDKgiQznnY39TWZOZjxvWFORItiIAtjku1+SKFr+7o9yASHf/Dzlluv7z6Zzh
 y/v4UTsvvSZqsR0DAa0OYoWRnMTJn748=
X-Received: by 2002:a17:906:9b0a:b0:72e:e524:180a with SMTP id
 eo10-20020a1709069b0a00b0072ee524180amr3271117ejc.131.1658576921332; 
 Sat, 23 Jul 2022 04:48:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vyZBGNRbF0ZjQlLYaS8ML/yRZ5L8drv2ycHWAcVu8TpDFOZNe6A019znSVgIWk9LkOsIToanW2wZpVwpl3KE8=
X-Received: by 2002:a17:906:9b0a:b0:72e:e524:180a with SMTP id
 eo10-20020a1709069b0a00b0072ee524180amr3271099ejc.131.1658576921140; Sat, 23
 Jul 2022 04:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220720131204.591104-1-lulu@redhat.com>
 <CACLfguXo3=h0PsHh+oehVcTjRNSqwOCiG9-VM_o7HjUdZBtxcA@mail.gmail.com>
 <20220722082054-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220722082054-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Sat, 23 Jul 2022 19:48:05 +0800
Message-ID: <CACLfguXnqYZbYY-ReAGPBFNp02ffXSk1pmWbzmvJbbODnq81nw@mail.gmail.com>
Subject: Re: [PATCH v13 00/10] vhost-vdpa: add support for configure interrupt
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Jul 2022 at 20:21, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Jul 22, 2022 at 03:46:52PM +0800, Cindy Lu wrote:
> > Hi Micheal.
> > Would you help review these patches, not sure if this is ok to merge?
> > Thanks
> > Cindy
>
> Pls note threading is broken in the patchset. Care to repost?
>
Thanks Micheal, I have reposted a new version, would you help review it?

Thanks
> --
> MST
>


