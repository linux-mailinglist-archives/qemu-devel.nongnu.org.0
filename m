Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5D24A48FE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:07:41 +0100 (CET)
Received: from localhost ([::1]:56882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXLI-0002T3-Qx
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:07:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eterrell@redhat.com>)
 id 1nEWCR-0001jQ-TY
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 07:54:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eterrell@redhat.com>)
 id 1nEWCN-0004t1-13
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 07:54:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643633661;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=EmO5fshv38EVPTgf+BM6FXAUFx20XIa/FYoAVPUPdHs=;
 b=bc3irsWVm7VcPAXCrB7dEnBAszR/H8C7KNFgN3lCQvfBHgmdkYmXb0mvQmkzdpbB4X50sZ
 gHV5f6nhiaacJO8rQAodfK73lp9IL7Yi7IOU22QCBR1HCnYkOGTHUG8nLT3lZhCBL3lKwS
 6hQB/ggB4KgXeaduCeAdXsHyMVTiFIU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-Ji1w6HjyMdqNjy-hsyHYsQ-1; Mon, 31 Jan 2022 07:54:15 -0500
X-MC-Unique: Ji1w6HjyMdqNjy-hsyHYsQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 j21-20020adfa555000000b001db55dd5a1dso4790557wrb.15
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 04:54:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=EmO5fshv38EVPTgf+BM6FXAUFx20XIa/FYoAVPUPdHs=;
 b=M9RHNxWwVgBIBCRsXS79s/qerkvJAc+Z+vXPyPQi+kSC1vJaPTzVyy+EzrtXka7/6u
 qo2q0gtJQ4Tfw2v6GoqdI2A5F0rIoh8a4cWjg2WZmwPWfX0cLJ0M40le9EOdFzFXX3PS
 DJM/bHR3gU3FoCzKUYakFXRjZ533yde393PM+VHdV+Fje5u+3kX6gF6moeL2XRxp31El
 +sn0+7mZa05REcP9tsOGFAsrHHDEdUE0nhYrGyPuzVVb8aevnuzH0hslE8Sw78lswYun
 LoqsdzJxQOXl+TBEApcyIPkR+zPOrBNqIp/rTzZOMmlttTpDI/AR5mxQMCm6QdxSV1jQ
 xd3Q==
X-Gm-Message-State: AOAM5313HPVBOcMz68vheUMgR9AGDWQlvv5GtMPtxWnnwIYCiDLqlUNa
 4urCVAMswE7as125cmUi2KEbq/FIfDaykYX9y71eBH2i3i3imUZhIZxCtPvwJcxqxtXr65usrV5
 4ZpFzBGz2JqOUE1RjF720KXVlxumrQ+Q=
X-Received: by 2002:adf:d0d1:: with SMTP id z17mr17624614wrh.301.1643633653664; 
 Mon, 31 Jan 2022 04:54:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwiUCKFTdeUhchqmS40BLMc708VV+/7n0Xn4ISl8mxBsJGP4ljM7fCba9Fefy6zLthwQz4j3ZRs6dwBiZcwcE0=
X-Received: by 2002:adf:d0d1:: with SMTP id z17mr17624592wrh.301.1643633653315; 
 Mon, 31 Jan 2022 04:54:13 -0800 (PST)
MIME-Version: 1.0
From: Eduardo Otubo <eterrell@redhat.com>
Date: Mon, 31 Jan 2022 13:54:02 +0100
Message-ID: <CAGMDDkd07FTemjXL=5OwTdx0ZEJv85wAp=AS--B_Po7qmu8=yg@mail.gmail.com>
Subject: Stepping down from seccomp mintainership
To: qemu-devel@nongnu.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eterrell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eterrell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: otubo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello all,

It's been a while since my last commit or pull request, and given the
current state of things I don't think I'll be coming back to actual
QEMU development. At least not as frequently as I wanted to have
seccomp under my eyes at all times.

This being said, I'd like to retire as the seccomp maintainer. Anyone
who wishes to take over from here is welcome to do so.

Thank you all,

--
Eduardo


