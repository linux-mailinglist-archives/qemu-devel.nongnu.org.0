Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3EA551359
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 10:52:26 +0200 (CEST)
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3D8z-0001t5-Sr
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 04:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3D58-0007Hn-RU
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:48:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3D50-0007Ex-LL
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655714898;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5c0MsyD/+b2pl5TqAkdCdv7qBtF4VMfZQAv4i8UH1B0=;
 b=NNMl2RGTVlISIXuKOkM6FuK/4sKDa0gBKA+fvV+gfQtRbKyf+/rdpG0kFz7n0vQNJXpBin
 sEgrCZ+9t+J2Drk9hJetczSh3grnEhUAHJxm2pzXnsTIWMIZqMPDh8NoiqUzxu8++e3zzU
 V74YsAvgEpbQy+1aDwLUvyRmwpnpV+A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-oYX_Jfv7PdO_lCDbJ8n6nw-1; Mon, 20 Jun 2022 04:48:15 -0400
X-MC-Unique: oYX_Jfv7PdO_lCDbJ8n6nw-1
Received: by mail-wr1-f71.google.com with SMTP id
 a1-20020adfbc41000000b0021b90d6d69aso476055wrh.1
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 01:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5c0MsyD/+b2pl5TqAkdCdv7qBtF4VMfZQAv4i8UH1B0=;
 b=3D40bI4a1qw7n2/Dnyt0GlP5/n+eaZe776j4d13X8exs0ZK0qnvQfsYGO5TSUTPLTW
 bEoXrsnmCTZJ9EyPgLXRIuccZnNZ24e/59MgoJk+lzrOGQ+yAeeKTW+CvCvreOXRHRSS
 x8VFC8rWSddlbjPdb3fSE7pLwRVHRnwAa5nbNdpUyovee3eKo0eNzVYHtRLXEYE8Y2UB
 1cWZzO6zMK4ukmpih0NUFmyLoWztsRJXXnaF/ZIRIApxMNNZZooLI60rK+EkQvcpTDnk
 OPtt5npRWlI3RiWin1ymg3YenM4fUiCAvlzE1B+WppPr3Gyqt+M0oX7kofJm36idu5cT
 Yt2g==
X-Gm-Message-State: AJIora8/E19VI9wuiCaaFhDNfL9laKoa27L/TvhLJjsnnJZCC+cDNE7+
 pP9iD2JwKfIbk0GmDUBfVnqTpaOIvrrzaWTpDeYa8/FZqqyoroZUZgvV+g+doF1/034TfPm0zTy
 8vuLZZZQ0c3upEyA=
X-Received: by 2002:a5d:5608:0:b0:21b:88a0:d260 with SMTP id
 l8-20020a5d5608000000b0021b88a0d260mr9276918wrv.359.1655714894622; 
 Mon, 20 Jun 2022 01:48:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1scuuyVloCJGvUE/qnVeJrcrCUavYkTfZnft7H34vV3Nk8MK4t7y2MZ7L3ZZ9SWZEHrcwHDfg==
X-Received: by 2002:a5d:5608:0:b0:21b:88a0:d260 with SMTP id
 l8-20020a5d5608000000b0021b88a0d260mr9276903wrv.359.1655714894469; 
 Mon, 20 Jun 2022 01:48:14 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 d6-20020adfef86000000b0021b8d1b0568sm3545680wro.52.2022.06.20.01.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 01:48:13 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  "Dr. David
 Alan Gilbert"
 <dgilbert@redhat.com>,  Eric Blake <eblake@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Peter Xu <peterx@redhat.com>,  =?utf-8?B?5b6Q6Zev?=
 <xuchuangxclwt@bytedance.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v4 2/4] QIOChannelSocket: Fix zero-copy send so socket
 flush works
In-Reply-To: <20220620053944.257547-3-leobras@redhat.com> (Leonardo Bras's
 message of "Mon, 20 Jun 2022 02:39:43 -0300")
References: <20220620053944.257547-1-leobras@redhat.com>
 <20220620053944.257547-3-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 10:48:13 +0200
Message-ID: <878rpr67qq.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Leonardo Bras <leobras@redhat.com> wrote:
> Somewhere between v6 and v7 the of the zero-copy-send patchset a crucial
> part of the flushing mechanism got missing: incrementing zero_copy_queued.
>
> Without that, the flushing interface becomes a no-op, and there is no
> guarantee the buffer is really sent.
>
> This can go as bad as causing a corruption in RAM during migration.
>
> Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy
> flag & io_flush for CONFIG_LINUX")
> Reported-by: =E5=BE=90=E9=97=AF <xuchuangxclwt@bytedance.com>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


