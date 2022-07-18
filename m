Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A40577E50
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 11:05:45 +0200 (CEST)
Received: from localhost ([::1]:60396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDMhE-0003gp-5n
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 05:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDMet-0001tG-Gp
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:03:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDMeq-0004Ig-BQ
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658134995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=STxJw0edt/V95e0NAfxCtbjXbnURubOGo3bYFYYnAPM=;
 b=OTABDAMg+NsDfXOl5cYts/68tPpdYTPwgo88pz6pd6x0AcEKzA6Hz2+3Z1RiLT3Y6VxiIt
 SjOEv24h7I6GWHTiusOeLeDsb+uGh7v/+uNUBfS7UxjFPVQD/XlAJaJcFsXgt9LwGntbt8
 gQdM+TFRTcrWhOAucnuHpc6bL1UqnpU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-qStOp4GRM7-U76q-R_3nmg-1; Mon, 18 Jul 2022 05:03:05 -0400
X-MC-Unique: qStOp4GRM7-U76q-R_3nmg-1
Received: by mail-lf1-f70.google.com with SMTP id
 b7-20020a0565120b8700b004890b28f7c8so4003791lfv.7
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 02:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=STxJw0edt/V95e0NAfxCtbjXbnURubOGo3bYFYYnAPM=;
 b=TsgxDTKIbTbH05NreBGWLVzIrkrjYdu5GWoaj6vNgRRiyJxO0rXYGhw3xNQPLOtFHC
 fJQHDSBJ0AD+jJSO/ahpr+NKqgXp/1SL5/uIe56dZD6CQElaxiacvq9dS5LZfsidmFkx
 zoK6YbkQe77FbW/yellRyjwp6hcn4SC0qK+pTl75tlyaG/x36CbD9wUWTgDm2GWkNbvm
 dr6zo8wS3Twgr//eIaXxlt7ddnyT9KJI+YZ62Oi+rmnTxzl0wTU3Wmlu1DaEC340/lf1
 6n5Upzp0cTrTXxsM5+Svhk8nsznuTg9OrL0YAHoVllHmeAaNAH0pFjSQKfj05UAO45Ax
 mE9A==
X-Gm-Message-State: AJIora9vE6fmDNAmX6aOZE4r44vS4pLzivJQQOguKF+Z18eoK/QKk5Bs
 qPWoliRf5pQ56/+RpMV0hiQeyMYrXkV1DS/AS5cJ8prJ/Y+ZqIOh5rj1LLXKhEt41ID8f6nMPKh
 +QAbvcJiQMWEp2eP+esyMFl3Zg33LZYU=
X-Received: by 2002:a05:651c:2103:b0:25d:6478:2a57 with SMTP id
 a3-20020a05651c210300b0025d64782a57mr12116744ljq.496.1658134984118; 
 Mon, 18 Jul 2022 02:03:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sjVY/Qit0LolxdlU3GsEAVXQfeedOgCmAFSBlf7P+hjWTx1rqU1zIQ9DT20It2okP4kcR8iez6FVxiJV6LKL8=
X-Received: by 2002:a05:651c:2103:b0:25d:6478:2a57 with SMTP id
 a3-20020a05651c210300b0025d64782a57mr12116737ljq.496.1658134983844; Mon, 18
 Jul 2022 02:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <cfdc8ffef03c4574a72faea46f2e1ef1@auriga.com>
 <CACGkMEvRNMoUSGQZa7wvQu=FKgKw3RJmioHZy1r3f6bYTS-JFQ@mail.gmail.com>
 <ae177ae534fa4045885916299bbb0652@auriga.com>
In-Reply-To: <ae177ae534fa4045885916299bbb0652@auriga.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 18 Jul 2022 17:02:52 +0800
Message-ID: <CACGkMEtKZqtN5FXZFXTTyMmJQ-T7NE=v2nGD7_GWaYdzhCxxtQ@mail.gmail.com>
Subject: Re: Internal MAC addresses list (mac_table) usage
To: "Ovchinnikov, Vitalii" <vitalii.ovchinnikov@auriga.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Thu, Jul 14, 2022 at 7:54 PM Ovchinnikov, Vitalii
<vitalii.ovchinnikov@auriga.com> wrote:
>
> Hi Jason,
>
> Thanks for pointing out that corner case with "52:54:00:12:34:XX".
>
> In the NIC model I'm developing qemu_macaddr_default_if_unset is called every time MAC is updated in the NIC registers.
> This way a just assigned "52:54:00:12:34:XX" MAC is at least marked as used in the mac_table.
>
> However it doesn't cover the case when "52:54:00:12:34:XX" MAC being assigned through NIC registers has already been assigned to another NIC by QEMU.

This should be fine, and it needs to be addressed in a separate patch.

Thanks

> So one more improvement the code might need is a way to check whether MAC is free or used from within NIC model.
> Returning bool from qemu_macaddr_default_if_unset may well do the trick. Moreover it might also help to spot an error when -1 is returned from qemu_macaddr_get_free (for the time being it's silently interpreted as 0xFF MAC LSB).
>
> BR,
> Vitalii
>
> From: Jason Wang <jasowang@redhat.com>
> Sent: Thursday, July 14, 2022 9:44
> To: Ovchinnikov, Vitalii
> Cc: qemu-devel@nongnu.org
> Subject: Re: Internal MAC addresses list (mac_table) usage
>
> On Tue, Jul 12, 2022 at 4:43 PM Ovchinnikov, Vitalii
> <vitalii.ovchinnikov@auriga.com> wrote:
> >
> > Hi folks,
> >
> > While developing an Ethernet NIC model I noticed that QEMU maintains the following internal array which marks used/free MAC addresses in net/net.c:
> >
> > static int mac_table[256] = {0};
> >
> > with three private (static) functions accessing it: qemu_macaddr_set_used, qemu_macaddr_set_free, qemu_macaddr_get_free.
> > Public (non-static) interface to this array includes two functions: qemu_macaddr_default_if_unset and qemu_del_nic.
> >
> > The vast majority of existing NIC models calls qemu_macaddr_default_if_unset in their *_realize functions replacing zeroed-out MAC address with the free one returned by QEMU, for instance (lan9118_realize functions from hw/net/lan9118.c):
> >
> >    ...
> >     qemu_macaddr_default_if_unset(&s->conf.macaddr);
> >
> >     s->nic = qemu_new_nic(&net_lan9118_info, &s->conf,
> >                           object_get_typename(OBJECT(dev)), dev->id, s);
> >     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
> >    ...
> >
> > qemu_del_nic is being called from net_cleanup function right before QEMU finishes execution.
> >
> > What appears to be a possible SW architecture gap is that NIC models have no means to inform QEMU about changing their MAC addresses during execution (again from hw/net/lan9118.c, do_mac_write function):
> >
> >     case MAC_ADDRH:
> >         s->conf.macaddr.a[4] = val & 0xff;
> >         s->conf.macaddr.a[5] = (val >> 8) & 0xff;
> >         lan9118_mac_changed(s);
> >         break;
> >     case MAC_ADDRL:
> >         s->conf.macaddr.a[0] = val & 0xff;
> >         s->conf.macaddr.a[1] = (val >> 8) & 0xff;
> >         s->conf.macaddr.a[2] = (val >> 16) & 0xff;
> >         s->conf.macaddr.a[3] = (val >> 24) & 0xff;
> >         lan9118_mac_changed(s);
> >         break;
> >
> > lan9118_mac_changed function here simply changes NIC info string using qemu_format_nic_info_str, hence stale MAC address stays marked as used in the mac_table whereas it's not actually in use any more.
> >
> > Am I right in thinking of it as a SW architecture gap/bug that needs to be addressed?
>
> I think so. Note that the code can not deal with the case when
> "52:54:00:12:34:XX" was passed from cli.
>
> Thanks
>
> >
> > BR,
> > Vitalii
> >
>
>
>


