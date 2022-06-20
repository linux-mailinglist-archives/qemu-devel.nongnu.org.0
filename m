Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DC055133A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 10:49:49 +0200 (CEST)
Received: from localhost ([::1]:37458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3D6S-0007ol-MD
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 04:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3D4X-0006MO-83
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:47:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3D4V-0007BW-Ix
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:47:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655714866;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S9nefaWeWN6lR38cIzUVCyWb6JprEzekAyNyOoFNxBE=;
 b=Dl6D7JLGZTjoX+ehvexZhU6ePgHC2vlQqPw/MZvHBQaE6oU456XYThRp5IyNLxSnRJKF+u
 LP/SnS+j0gG2TPNqv0fCEz+TiICwzlAvTA10+0muk5JkM6/UZMPO0T1/mbHrpP3OjzzFK8
 B9qTAXSf0ifjDxJImmXigUOEK096Iso=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-UiYnSjHRPtaaxTrUEyUheg-1; Mon, 20 Jun 2022 04:47:44 -0400
X-MC-Unique: UiYnSjHRPtaaxTrUEyUheg-1
Received: by mail-wr1-f69.google.com with SMTP id
 c7-20020adfa707000000b002184d715e69so2256086wrd.10
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 01:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S9nefaWeWN6lR38cIzUVCyWb6JprEzekAyNyOoFNxBE=;
 b=obEGGLOCg1oGpyn3CvA6dY/BsYCXP7DaMhfnWHkGIJ5OkBIjJEaNg83ezHwVSKRGKa
 swy+Bo/e8j2ePTNBMgYL5wdywjGNr7MHtk6Etbv9xlGd9anmfMT0HtJ+IE3jNWdZRXEG
 HebqUb8nd63a3m9ABe87NUnneRlEVv7JclROxMd2eX7NaVrlZdIPtDAZh0dLJTjnJvto
 v0vnOXU1SkgBE1ksb4kY3bNWRM9NsC0KT243bOjhtQaNkZNIhLo/yBzXnfeXWzvzGXfP
 9TkC2GV7ZluEe6Ema7UJBMNJbMCgx+v8+GaPfjVgl5zl/xpuchmy3rMVeHV6E1DjFUaQ
 sS7Q==
X-Gm-Message-State: AJIora9YSt4SnHpy2TMDRi1YHDSHjulyCiCaCg+PdrPeI2N1uieD9p3d
 QkAS8uMOxvhdMvv78jrOqpvQuFdLgmEqa8LRK2Uxj9DV7WhUVWqIc0h5a5w0mOU1jZVRmOneEpN
 QIs+KA3MKPNCy/D8=
X-Received: by 2002:a05:6000:15c1:b0:218:468b:4c01 with SMTP id
 y1-20020a05600015c100b00218468b4c01mr21926449wry.60.1655714863065; 
 Mon, 20 Jun 2022 01:47:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uz4lsnDfXe6kuvUqYkyjKk2JqUvoTfmFw3Ds0FS5A/Kck6XBHZV/Q4EMPYjIxIcu/eu8UA1A==
X-Received: by 2002:a05:6000:15c1:b0:218:468b:4c01 with SMTP id
 y1-20020a05600015c100b00218468b4c01mr21926422wry.60.1655714862845; 
 Mon, 20 Jun 2022 01:47:42 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 b3-20020a5d5503000000b0021b881c4c5csm6316911wrv.53.2022.06.20.01.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 01:47:42 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  "Dr. David
 Alan Gilbert"
 <dgilbert@redhat.com>,  Eric Blake <eblake@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Peter Xu <peterx@redhat.com>,  =?utf-8?B?5b6Q6Zev?=
 <xuchuangxclwt@bytedance.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v4 1/4] QIOChannelSocket: Introduce assert and reduce
 ifdefs to improve readability
In-Reply-To: <20220620053944.257547-2-leobras@redhat.com> (Leonardo Bras's
 message of "Mon, 20 Jun 2022 02:39:42 -0300")
References: <20220620053944.257547-1-leobras@redhat.com>
 <20220620053944.257547-2-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 10:47:41 +0200
Message-ID: <87czf367rm.fsf@secure.mitica>
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

Leonardo Bras <leobras@redhat.com> wrote:
> During implementation of MSG_ZEROCOPY feature, a lot of #ifdefs were
> introduced, particularly at qio_channel_socket_writev().
>
> Rewrite some of those changes so it's easier to read.
>
> Also, introduce an assert to help detect incorrect zero-copy usage is when
> it's disabled on build.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


