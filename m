Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12744D5F2B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 11:09:43 +0100 (CET)
Received: from localhost ([::1]:34898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nScDO-000830-I2
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 05:09:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nSc9D-0005Cg-DD
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:05:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nSc9C-0002ev-0H
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:05:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646993121;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndzpuLrxwEcueCMrsHu2Ct89DqE+b+e/Nd1reRLRMi4=;
 b=Nlvm2B5KCyBvck7Ucb/1Xb1qa4jyjqhmaitv1KUf9t5IUBQ2uYUO/zv39OHEM4XmidOcCD
 gx5Ij1UT6vjnA9O+KhJxoP1o0Um8xGun2YWytPXEte1bU+cvb2OBZKRgZJ2xUHVr7TEbGv
 ZWmRNO9OQ35bbGsBZ5Vbotmu2eSz7j4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-QDlzCDEJO-CkfUSbbh80rA-1; Fri, 11 Mar 2022 05:05:20 -0500
X-MC-Unique: QDlzCDEJO-CkfUSbbh80rA-1
Received: by mail-wr1-f72.google.com with SMTP id
 p18-20020adfba92000000b001e8f7697cc7so2625975wrg.20
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 02:05:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ndzpuLrxwEcueCMrsHu2Ct89DqE+b+e/Nd1reRLRMi4=;
 b=B3w3GKEzLlXgDgXJ1KxiI+y1Bh8/R/dNiY1lJNmYC+UJAXzY6OIppBwcMLucIs2UCI
 tSuuUDs/xWZQMy1Un06L0MhEnIYGMNUf3FG7+l5mFkTxF3b4WT51lS3ge29Haq8DQ0WI
 dHkjF/WY3VCiNtWEDE7nbvohbLydoeGm5f/sqCAeVPTxJy9BRTsm6DnFBzhD34yj/KVu
 E5hiRnzivJMo3yUQC77MyU3eK/IwMq82lDba4r2ShoIR517xmxlCzo5Xr+TY2ARZttAn
 izLYy9d+N85+bmDIE/JdEfQBTSct1EZxpS2cH7xBjNIj/eFIwnMKCLUV8ZgbSPftlzSh
 2CRQ==
X-Gm-Message-State: AOAM532UTqluJqBxZPsyoZGutM1xgGxySJrZCSCfRiEtK5VBCqCZURwa
 urFuLr6n+skIR/BqZPjEwrtF/EDWL4meJlRaU3qa8vwZUZyofv2ScO5R85YsTg54jpFM4q3nTpO
 pRuUhszKvOwPazqQ=
X-Received: by 2002:a5d:52c8:0:b0:1ed:e591:be70 with SMTP id
 r8-20020a5d52c8000000b001ede591be70mr6738184wrv.436.1646993119144; 
 Fri, 11 Mar 2022 02:05:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzz+Rkl7XRAHbeHLDp4RIWz1Q1v4pLYvgy9NRow2IyPYBVYcx5rKi5vEoTkOpr10OLt5p9+JQ==
X-Received: by 2002:a5d:52c8:0:b0:1ed:e591:be70 with SMTP id
 r8-20020a5d52c8000000b001ede591be70mr6738166wrv.436.1646993118875; 
 Fri, 11 Mar 2022 02:05:18 -0800 (PST)
Received: from localhost (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm6230933wrn.30.2022.03.11.02.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 02:05:18 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 04/18] tests: print newline after QMP response in
 qtest logs
In-Reply-To: <20220310171821.3724080-5-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Thu, 10 Mar 2022 17:18:07
 +0000")
References: <20220310171821.3724080-1-berrange@redhat.com>
 <20220310171821.3724080-5-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 11 Mar 2022 11:05:16 +0100
Message-ID: <87tuc4iz37.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> The QMP commands have a trailing newline, but the response does not.
> This makes the qtest logs hard to follow as the next QMP command
> appears in the same line as the previous QMP response.
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


