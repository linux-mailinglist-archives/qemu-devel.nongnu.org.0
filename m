Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03274BFE86
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:27:50 +0100 (CET)
Received: from localhost ([::1]:55814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMY0x-0006Ot-TY
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:27:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nMXfN-0003Wr-7F
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 11:05:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nMXfI-0003eF-Ue
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 11:05:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645545921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H90CJF3i8lVexg07lGbuBvR+s6jj0kd2VJDBVVMJstE=;
 b=HXoCuc7lxU1BlqLbLnTtUtoI/xTL+g5zgStxMmf9UdIoJI5M08PblaZZT3wE52h1P8+7CR
 /NT5keAA1kumdVrbM5tHt6ry4XyyQCbSgFWd4gMoM17+bCzOp0eYIkyx1dbuZb0V/dLN57
 SQtOtbtxBt/88j97muzVFYIzjVPdzHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-G1cckRVWOsmWpHkn0Ctcjg-1; Tue, 22 Feb 2022 11:05:18 -0500
X-MC-Unique: G1cckRVWOsmWpHkn0Ctcjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B407800422;
 Tue, 22 Feb 2022 16:05:17 +0000 (UTC)
Received: from localhost (unknown [10.39.193.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 893B4865A6;
 Tue, 22 Feb 2022 16:05:16 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] gitlab: upgrade the job definition for s390x to 20.04
In-Reply-To: <20220221230607.1277120-1-alex.bennee@linaro.org>
Organization: Red Hat GmbH
References: <20220221230607.1277120-1-alex.bennee@linaro.org>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Tue, 22 Feb 2022 17:05:14 +0100
Message-ID: <87r17u7upx.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 21 2022, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> The new s390x machine has more of everything including the OS. As
> 18.04 will soon be going we might as well get onto something moderately
> modern.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>  .gitlab-ci.d/custom-runners.yml               |  2 +-
>  ...18.04-s390x.yml =3D> ubuntu-20.04-s390x.yml} | 28 +++++++++----------
>  2 files changed, 15 insertions(+), 15 deletions(-)
>  rename .gitlab-ci.d/custom-runners/{ubuntu-18.04-s390x.yml =3D> ubuntu-2=
0.04-s390x.yml} (87%)

Acked-by: Cornelia Huck <cohuck@redhat.com>


