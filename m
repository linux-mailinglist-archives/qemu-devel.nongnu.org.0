Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29760610ABC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 08:52:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooJCm-0003fb-Ae; Fri, 28 Oct 2022 02:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ooJCS-0003b2-Qd
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 02:50:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ooJCO-0005S9-PA
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 02:50:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666939835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xo8YpL2+8A6BDqGQ9/6Yy1O33xNb2wSxsxRgAzv81vg=;
 b=LlOPVxMIlOLJo/DBY4WMiGfnfBT0CTO884TZLw4dz7iNVZ+tBQQdIU67qteW1Hbl/I+EVG
 rryez3VsvttpPQtUQ8hesB+3OKYmzJ/aonV4hSg95ubtILYqcg1KJIohHn/SYvqcr5f9xv
 cCUreRLdyJeXhkAhf3gZUXdQsy27oFw=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-12-eRoPpFB1NMeqc46KY0qmsw-1; Fri, 28 Oct 2022 02:50:34 -0400
X-MC-Unique: eRoPpFB1NMeqc46KY0qmsw-1
Received: by mail-pf1-f198.google.com with SMTP id
 e12-20020a62aa0c000000b0056c12c0aadeso2126402pff.21
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 23:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xo8YpL2+8A6BDqGQ9/6Yy1O33xNb2wSxsxRgAzv81vg=;
 b=O9wkyhIALkMMzmnvc86VxIwlQgSsIyuYFrfaED34xNpHs8tkL8KabSA87PBTc22NOk
 iFLv+YAMoRBwFINIdZY4zop20VuiEFZeqPyEYjahYy+cut/uUx+VIIDF+zY+34TRaM7A
 aBJ697QmTxezvK4z8MxxPWPbKXCcz5UBZTDz32a9I58qKiwum5JZ+fZ1GuWYFpd99Wsp
 65F2r184lsQlvgsGBCuxMTY+3g8/YiASoqMxKmOJS0RtfUDH1cLuJhHeTmAdF3ahV6Y/
 5vWz9qtJ/1B6kNHCJCreIea3YEvTmr81UmEHcfOHO3qwTTCIovZ0LtwErktvNpJix0Ty
 B4CA==
X-Gm-Message-State: ACrzQf0ZwZ1m1Br8D0cScQFjVWxmXco3MD+xfJawYjmwe8y5v8A4RJ+Y
 yjX5Rs+0mUFG2Dis5XXBTu72Yh7eeJ6HVmyXGrfAsdnOblH3ADCpGJCfBY2VQOIqx/uTNlHqYdO
 lPgfwkdk/cQ14EPoBQafWNV0hBTglxww=
X-Received: by 2002:a17:90a:6845:b0:210:7ef5:ab99 with SMTP id
 e5-20020a17090a684500b002107ef5ab99mr14563718pjm.80.1666939833455; 
 Thu, 27 Oct 2022 23:50:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5oWMJk2tjWURkkGhW3E/9ldpVCjAMbh/RBBEQ6BDW8prVhyKtb1vfMCTVXHIHkR+/Bmbe/Uh6MVwV+RNHXJSM=
X-Received: by 2002:a17:90a:6845:b0:210:7ef5:ab99 with SMTP id
 e5-20020a17090a684500b002107ef5ab99mr14563690pjm.80.1666939833232; Thu, 27
 Oct 2022 23:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221020155251.398735-1-eperezma@redhat.com>
 <20221026165830-mutt-send-email-mst@kernel.org>
 <986d8ba9-2634-3224-d548-cf5563639c49@redhat.com>
In-Reply-To: <986d8ba9-2634-3224-d548-cf5563639c49@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 28 Oct 2022 08:49:57 +0200
Message-ID: <CAJaqyWd4PsYwnnPV0-qh4RhY4k0yLn1fHx=V=h86OTqi0pXQvQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Shadow VirtQueue event index support
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Laurent Vivier <lvivier@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 28, 2022 at 4:44 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/10/27 04:58, Michael S. Tsirkin =E5=86=99=E9=81=93:
> > On Thu, Oct 20, 2022 at 05:52:47PM +0200, Eugenio P=C3=A9rez wrote:
> >> Event idx helps to reduce the number of notifications between the devi=
ce
> >> and the driver. It allows them to specify an index on the circular
> >> descriptors rings where to issue the notification, instead of a single
> >> binary indicator.
> >>
> >> Adding support for SVQ.
> >
> > Jason seems to be taking this through net
> >
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>
>
> Ok, I've queued this.
>
> Eugenio, please post the fix for endian on top.
>

I've got a v2 ready to send, would it be possible to send it right now
and send a v2 pull? That would save a few commits where the vdpa
devices do not work with big endian architectures.

Thanks!


