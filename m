Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1862552165
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:42:52 +0200 (CEST)
Received: from localhost ([::1]:59500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JYB-000550-Vm
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JWT-0002oI-29
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:41:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JWR-0005YU-71
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655739662;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wU+OB5lUQfwbJz4ChuNXOlijO8m5CiuWJq7Gj88Ie8o=;
 b=PrrQouMdC7HfhsL+xnP6s6LOObGD15IVSkunjgvDBca1y7A+xvgaCTUu+W2XczmJwe7Y2p
 jqZ2WdXRCdQve+UC3GFB3oAfmVXIpBHbHXf74WBgkvE/rnJI3dYCvCbLEmWA2CPnyFCBem
 27qUoaURt/zmvMwuTS+xqX2XbkbJIsY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-YwULB7YtOEmQMj_jHRKVEQ-1; Mon, 20 Jun 2022 11:41:01 -0400
X-MC-Unique: YwULB7YtOEmQMj_jHRKVEQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 p24-20020a05600c1d9800b0039c51c2da19so5964117wms.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wU+OB5lUQfwbJz4ChuNXOlijO8m5CiuWJq7Gj88Ie8o=;
 b=zdsMQIMyIgCrBw17TfbnWK7TtIRCxzjqEUl3BAPCKYSTIr4nPka46K8W7TcGmfBfoC
 RyEX8/IhnFgXaY1eF9iiqKkDC4vrRMGaaQnuaeSNYZhj2wbWuizzRXmf/ViMm52UdMfD
 ItptmJ9vZlsnDFomyTcgoT+QFD7fQ7fSVXWS4dJr1KyEILfc9ke9NSS6/HeUQ9XZcfDL
 iv2HYwUNtJe5zQKX2fYb29N7MIEgkzTafCpOtoJ+kAYyzsX3lWyIYAOe/OhINHuk1PY+
 GkeCfzzoIstfTYNRK9cUDPXlrnzx1PWRdfhviqkqiO0ykb0FPBt61Ib/1G5uG4y+RgSn
 P8vA==
X-Gm-Message-State: AJIora/ExR8pvBX8O3Vo9tNigaRaeQybsJm+X/wsOZZr7POPe5ipMigT
 v8ZfxEpio17MTvPqi9n2ilezZfmXSiK5Au40I39QCj7aNEz8gDDNhSnBUXfrdXiqiMhBN2RbblU
 zVPHO7wvRzeGRLyQ=
X-Received: by 2002:a05:6000:154c:b0:219:bee5:6b76 with SMTP id
 12-20020a056000154c00b00219bee56b76mr23532195wry.194.1655739660269; 
 Mon, 20 Jun 2022 08:41:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sayYeyBg99bTc51ict74dokYEyJh8/L33znMzpstYzCbckiQZLLEI4VjvY2NsAtnqk6y3wpw==
X-Received: by 2002:a05:6000:154c:b0:219:bee5:6b76 with SMTP id
 12-20020a056000154c00b00219bee56b76mr23532186wry.194.1655739660096; 
 Mon, 20 Jun 2022 08:41:00 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 c5-20020adffb45000000b0021b91d1ddbfsm2360692wrs.21.2022.06.20.08.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:40:59 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 18/21] migration: remove the QEMUFileOps 'get_buffer'
 callback
In-Reply-To: <20220620110205.1357829-19-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:02:02
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-19-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:40:59 +0200
Message-ID: <87a6a71gxg.fsf@secure.mitica>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> This directly implements the get_buffer logic using QIOChannel APIs.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


