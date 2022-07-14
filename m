Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD64C574553
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 08:52:28 +0200 (CEST)
Received: from localhost ([::1]:49478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBsi2-0004Al-QM
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 02:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBsal-0000CF-Ks
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 02:44:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBsad-0001Dc-Fj
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 02:44:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657781085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yQRdEkcINS+tmdhy4ORoHDkz4Sx54IAALLfC8KV7Yu0=;
 b=DCl2459wvpCr+5yOWZb853uI6AQHyKO0NaysXKy+rXK/qg0nU8craNoEAEwFNCqvZ86hek
 iZFNr2VT1BlaqG8kk5v5cmSWzXFm8eNXkmOQWPyZlxFSkH5VuC0MRkYO8vQ5lZsOuDieQG
 o1KRiyVX/17cp/CNJnNtXo8ZDgbtCek=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-yI19kK6oO4KLHNr5ja1nTw-1; Thu, 14 Jul 2022 02:44:43 -0400
X-MC-Unique: yI19kK6oO4KLHNr5ja1nTw-1
Received: by mail-lf1-f70.google.com with SMTP id
 f29-20020a19dc5d000000b004811c8d1918so403492lfj.2
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 23:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yQRdEkcINS+tmdhy4ORoHDkz4Sx54IAALLfC8KV7Yu0=;
 b=b8xtq6Y7j4+TBdPgbxqTADZfsMOwHfyyCSXBiMJGYTvH5tmrQkdWIqMF0luCaJ5IHy
 j5mfc9VOYmrbE1vdNMeupHbTDpiZX28wIJDc1bzA/wCnLbUMb6Lw17dto3QQd5Dd04eJ
 CzLh2uiFU50YJ7IGiuZNP5W9DwnIQ1Ci/xXMRSvMHanTXpr5vSTMRZkSEKtj6hOL6FU0
 Q6Sch7pZG/hTut1zyhyMBXBWH7j/HDsx53kqgLNQmo3BUZaQtDiAR/TmojmfYBBHj5sg
 ojzOB1/h9rYVqHuIDskU3PXGcO8ZCiaOF2N0/O6msPXqrnZjUu48VueIzhPDnhGw9U9q
 oejA==
X-Gm-Message-State: AJIora8XGqwQCXm1Lk4dew5TGkFCZUMsA/Oa+EZbLjvJWrnKQ0ebc1Xs
 Lh3v/Ig4lsEOjKwUMQtD0F6T0O8KVcrMEc2VGjxBJm4C8ulfqjAHcDkrpZ0vR8aXiztsHCGitec
 E+Uqmc/qqwqD3gSPM5v7/kb+sp3ZVsV8=
X-Received: by 2002:a2e:1451:0:b0:25d:7899:eddc with SMTP id
 17-20020a2e1451000000b0025d7899eddcmr3514414lju.251.1657781081730; 
 Wed, 13 Jul 2022 23:44:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uFBwbpwgMFhE/xu2muc1Pxs1hoAIeh9JgsvrojqSCGP0xwSP3e86mZ3+LkRlGZEPb4wSPj31kKYzIJsueZMGM=
X-Received: by 2002:a2e:1451:0:b0:25d:7899:eddc with SMTP id
 17-20020a2e1451000000b0025d7899eddcmr3514401lju.251.1657781081473; Wed, 13
 Jul 2022 23:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <cfdc8ffef03c4574a72faea46f2e1ef1@auriga.com>
In-Reply-To: <cfdc8ffef03c4574a72faea46f2e1ef1@auriga.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 14 Jul 2022 14:44:30 +0800
Message-ID: <CACGkMEvRNMoUSGQZa7wvQu=FKgKw3RJmioHZy1r3f6bYTS-JFQ@mail.gmail.com>
Subject: Re: Internal MAC addresses list (mac_table) usage
To: "Ovchinnikov, Vitalii" <vitalii.ovchinnikov@auriga.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jul 12, 2022 at 4:43 PM Ovchinnikov, Vitalii
<vitalii.ovchinnikov@auriga.com> wrote:
>
> Hi folks,
>
> While developing an Ethernet NIC model I noticed that QEMU maintains the following internal array which marks used/free MAC addresses in net/net.c:
>
> static int mac_table[256] = {0};
>
> with three private (static) functions accessing it: qemu_macaddr_set_used, qemu_macaddr_set_free, qemu_macaddr_get_free.
> Public (non-static) interface to this array includes two functions: qemu_macaddr_default_if_unset and qemu_del_nic.
>
> The vast majority of existing NIC models calls qemu_macaddr_default_if_unset in their *_realize functions replacing zeroed-out MAC address with the free one returned by QEMU, for instance (lan9118_realize functions from hw/net/lan9118.c):
>
>    ...
>     qemu_macaddr_default_if_unset(&s->conf.macaddr);
>
>     s->nic = qemu_new_nic(&net_lan9118_info, &s->conf,
>                           object_get_typename(OBJECT(dev)), dev->id, s);
>     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
>    ...
>
> qemu_del_nic is being called from net_cleanup function right before QEMU finishes execution.
>
> What appears to be a possible SW architecture gap is that NIC models have no means to inform QEMU about changing their MAC addresses during execution (again from hw/net/lan9118.c, do_mac_write function):
>
>     case MAC_ADDRH:
>         s->conf.macaddr.a[4] = val & 0xff;
>         s->conf.macaddr.a[5] = (val >> 8) & 0xff;
>         lan9118_mac_changed(s);
>         break;
>     case MAC_ADDRL:
>         s->conf.macaddr.a[0] = val & 0xff;
>         s->conf.macaddr.a[1] = (val >> 8) & 0xff;
>         s->conf.macaddr.a[2] = (val >> 16) & 0xff;
>         s->conf.macaddr.a[3] = (val >> 24) & 0xff;
>         lan9118_mac_changed(s);
>         break;
>
> lan9118_mac_changed function here simply changes NIC info string using qemu_format_nic_info_str, hence stale MAC address stays marked as used in the mac_table whereas it's not actually in use any more.
>
> Am I right in thinking of it as a SW architecture gap/bug that needs to be addressed?

I think so. Note that the code can not deal with the case when
"52:54:00:12:34:XX" was passed from cli.

Thanks

>
> BR,
> Vitalii
>


