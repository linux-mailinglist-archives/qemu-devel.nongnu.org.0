Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08EB41268C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 20:59:49 +0200 (CEST)
Received: from localhost ([::1]:49846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSOW4-0002ap-RL
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 14:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mSOTB-0006lw-F6
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 14:56:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mSOT7-0005qO-MW
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 14:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632164204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2caU3WY3weEfCmSPyOogyAXMdsGXKfBnQIt7aOaoFpc=;
 b=PePGqvSxpkgo7sVyUq4sVJCyg8h0ZW6pUobAX0dHdTx0tda0QFas5bCaQaYrjl2GmzkDR/
 URotsgjAjddtSkS8VxTraUfl4HrVG9BWf117xh2ar3mvzQSDrnxLQuTLN607nvroNANYvo
 3zltM5Ckbkrg60hjb7qcHKPvGTmge48=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-4kk6jC-8Ml6yl7JlC9HsUA-1; Mon, 20 Sep 2021 14:56:42 -0400
X-MC-Unique: 4kk6jC-8Ml6yl7JlC9HsUA-1
Received: by mail-pl1-f198.google.com with SMTP id
 c11-20020a170902724b00b0013ca44249e9so5528944pll.10
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 11:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2caU3WY3weEfCmSPyOogyAXMdsGXKfBnQIt7aOaoFpc=;
 b=UrK6DgVsVh2QMBIZhIk49WS7I9ohCiMV7rrbwv4582nEscwBHO8hr2S7vXI96K8lcP
 n2AgTXeol2NQMaZApbj6m5EgfaK5EupLkSumSDdgabLLJnqQaBAhjEW3laUTgPtpJrgq
 4lnPnCNbF1FUrg1aHa9GNxrGvhi49FqbI/5qFasuEsiUzw8w0msRRoYiH47PO2XocT9Q
 1EKNwFizbi3q3pjb4W5c5lLJt8Ge1JOYyyA9CuoMXXqiS7tNWWSvCdc8u52gGw+Nvqn2
 n0rz1g1rt9GYSXvtj6gngeI2n59RaeGA7Nrc0mwkhVSIaDpnuQf24dfCIb7zU5JoRjEt
 UwFQ==
X-Gm-Message-State: AOAM5312iydDJLB9SENCBNV5gl4J5xl9cP2TLQ907MvtkQaGEukLuFna
 QcH8o97mQFXuA4pkweyIGif1P+c71bktYJnOrkbNPaKPzZ2NhgXKtUei+ckv4KXDYMuU8oIonA4
 SYrmX7ycVdQIvFIKS5Ybsomjupk0WYCQ=
X-Received: by 2002:a17:90a:19d2:: with SMTP id
 18mr580249pjj.122.1632164201011; 
 Mon, 20 Sep 2021 11:56:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/W2I30rb29QIqt94VcUEj/tm2YXZ/zZxMw8KC6Z64U/kVgOZT+XmsQ9VvTwsexR/jxqU8Ls1ia8myQULWFMk=
X-Received: by 2002:a17:90a:19d2:: with SMTP id
 18mr580216pjj.122.1632164200654; 
 Mon, 20 Sep 2021 11:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201116183114.55703-1-hare@suse.de>
 <20201116183114.55703-3-hare@suse.de>
In-Reply-To: <20201116183114.55703-3-hare@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 20 Sep 2021 20:56:29 +0200
Message-ID: <CABgObfbUH4Djyicuie0-Bbu1zKrYN3+NDd56c5KA16s+Q+Liww@mail.gmail.com>
Subject: Re: [PATCH 2/3] scsi: make io_timeout configurable
To: Hannes Reinecke <hare@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 7:31 PM Hannes Reinecke <hare@suse.de> wrote:
> The current code sets an infinite timeout on SG_IO requests,
> causing the guest to stall if the host experiences a frame
> loss.
> This patch adds an 'io_timeout' parameter for SCSIDevice to
> make the SG_IO timeout configurable, and also shortens the
> default timeout to 30 seconds to avoid infinite stalls.

Hannes, could 30 seconds be a bit too short for tape drives?

Paolo


