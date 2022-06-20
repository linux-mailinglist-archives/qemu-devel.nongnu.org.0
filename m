Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A33B55215C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:41:13 +0200 (CEST)
Received: from localhost ([::1]:54050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JWa-0001Ki-2o
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JUw-0000QP-9i
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:39:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JUu-00055a-RW
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:39:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655739567;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y5TJGwx6k7kr6g4ksg2KK33VxHBsTSAk5TM77S2uHFY=;
 b=X+KIah9RqnQUN2jOvfRFDfIpuysqABAOy7/6MvDPFILMpC3uKVnCco1CyG5ZEwx9I3MLA0
 KiOB3xH9eqRJFPquByIJQDCfWl19QiPD+kGhZ//z47vhHchkVaDbYs91YR0wpPVWHljuHV
 wzbuNhrshTqTlQQ6AnRgazC9Eft5rWk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-TG_KtqA_O3mVKclDXWQkrQ-1; Mon, 20 Jun 2022 11:39:24 -0400
X-MC-Unique: TG_KtqA_O3mVKclDXWQkrQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l17-20020a05600c4f1100b0039c860db521so5146099wmq.5
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y5TJGwx6k7kr6g4ksg2KK33VxHBsTSAk5TM77S2uHFY=;
 b=WgwHd2uYgAhIL/K3qoeUJefJhWRy5XWADFCfDGImA9TyRgBcLlRPjFvnoaVMVxG6S6
 iP3vlN7XJNGnW0QRWy0fKchPtYCDOIYjQTu7ajae6V5a9pgqKuvTY7wlwBrlpP/hK0y+
 DrWPvtBghUrR7KxM5mYafxL2Kqj3u/EIsuQ4TcT5oeiQkxDwgyVqP63rQ2+8Q5wrKIEr
 yIbAT7aKK2VnaYfh+jv2P60SXr7WTAKM9OGfzh8kisncBj3QRo/Do+y4n5iUI3KJYqK9
 ypHiL6U73FljM6tYReWZj6TBZ1ae2Ga18YY5fXJ1C0aYAj9VjQKp9AEnPlWPk7gidv5v
 9Gog==
X-Gm-Message-State: AJIora/FGFtNIMUy/pi1h03wLSnLFDBp0pBx5cOAMGdm/nuWTrO1gccI
 UPuXYSgFirnlIR5mtrtbZ0gvjZSfSCxxXD/weE63/22WEJK90IRENb5SuOm3aUvdBFtOiNr/s6l
 xAJEm+mX5RW9T8EU=
X-Received: by 2002:a5d:5c0a:0:b0:218:548f:86a with SMTP id
 cc10-20020a5d5c0a000000b00218548f086amr22298412wrb.299.1655739562976; 
 Mon, 20 Jun 2022 08:39:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ua5w9+dd66VUd48mmsXLa7iZEs3QQaGtBON9f8TkJl8K0B8TqlKX7De7zKMEcydf5zCmkUfg==
X-Received: by 2002:a5d:5c0a:0:b0:218:548f:86a with SMTP id
 cc10-20020a5d5c0a000000b00218548f086amr22298399wrb.299.1655739562811; 
 Mon, 20 Jun 2022 08:39:22 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 p14-20020a5d48ce000000b0021020517639sm13544999wrs.102.2022.06.20.08.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:39:22 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 16/21] migration: remove the QEMUFileOps
 'set_blocking' callback
In-Reply-To: <20220620110205.1357829-17-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:02:00
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-17-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:39:21 +0200
Message-ID: <87ilov1h06.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> This directly implements the set_blocking logic using QIOChannel APIs.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


