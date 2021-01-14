Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0810D2F6B56
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:43:33 +0100 (CET)
Received: from localhost ([::1]:60536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08Wq-0005lV-38
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08V8-0004s0-QA
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:41:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08V7-0000pM-Bd
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:41:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610653303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jGqZZTG0bwYW0aDMO7aJJ8VXLrxFbTQ85y0r1JxMWs4=;
 b=alwRw68rAcvA+HegPvrQhhj9P4kkXItApur+V9FpBjOeJKViDPNDLNMwCaKogg83fjtY3W
 4HEp8Jcbz3qA4DZgnSYHU4r9auiq1f3nouNMXhaqyTRBnmea4SClVeZb1MHvXqZtm3RU+b
 FZqWMqNopYVeOiGYm/5OLl1//LCojX8=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-uwJBe2xVMSuSTLfdXhjMLw-1; Thu, 14 Jan 2021 14:41:41 -0500
X-MC-Unique: uwJBe2xVMSuSTLfdXhjMLw-1
Received: by mail-vk1-f200.google.com with SMTP id s127so2740983vka.11
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:41:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jGqZZTG0bwYW0aDMO7aJJ8VXLrxFbTQ85y0r1JxMWs4=;
 b=edgjFYqXSNjg/kP5n8EgETNS9Q58mfa5g7SMPDsJupOhAG06rDKeOk4jphpKWJam9G
 S4fbLb74pEjMZ3T5ObyTtG4EOH+B9nBLGr8QPzINlO7DYaEK+nxS58zbldQrcJ+D09mZ
 7rTBk86mHJMQRV2FGqyL+TU4jnMklx35luPR6DWUtXzmvAfGRluw3JOGP7i02wKOei/I
 3VjhBybv6xb0lSppkVaPodP9JalJlqosJEJvHyw6M9WOrQV2Yh5cENz/hIK9GrC759Gs
 dajuiDAJIKpakIrTQ2AcF4mlaPECuSNQAdQluhTCfM4zP7hZajM0fg7KGzVkMVV7sxRK
 fhfA==
X-Gm-Message-State: AOAM5302PE92gqqHx+W+v+4JOpFEqvqm27vnUrt+Sj9Ww0/6IvOVPO3b
 T+rrCJ9g9pOeZqyjitdyHjMgW8yHwJV3/5r6J/2AcjjLvjaSFO+1QeOATJDq/yE+UP9gKQpEcwQ
 lb3nd6CR6Jpk11BMRZiphcjJffp+yo9I=
X-Received: by 2002:a05:6102:7d8:: with SMTP id
 y24mr8008557vsg.50.1610653301035; 
 Thu, 14 Jan 2021 11:41:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGUbNlyz+d3R83W8nCYUtCNfieN7AGSmw0XiQ8IhcyHN4HIkHEFbwHeN1tSj4p/R2jwlJZpos6caDhcTDGvjo=
X-Received: by 2002:a05:6102:7d8:: with SMTP id
 y24mr8008550vsg.50.1610653300907; 
 Thu, 14 Jan 2021 11:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-9-alex.bennee@linaro.org>
In-Reply-To: <20210114165730.31607-9-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 14 Jan 2021 16:41:15 -0300
Message-ID: <CAKJDGDZxNxEVufw1fujD-=BjVs7gY6Aum240sQbwktYKYOmbMQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] docker: expand debian-amd64 image to include tag
 tools
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 2:25 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> This is going to be helpful when we want to both test the tool
> integration and in the case of global generate a xref doc build.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/docker/dockerfiles/debian-amd64.docker | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


