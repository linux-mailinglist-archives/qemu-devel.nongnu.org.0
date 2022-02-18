Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028AB4BBDBA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 17:42:20 +0100 (CET)
Received: from localhost ([::1]:53808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL6Ko-0006wb-Ng
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 11:42:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nL6IV-0005Li-NK
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 11:39:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nL6IT-0006Ct-8D
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 11:39:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645202392;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIo4l+IcYek3ZlYe95hRJtd5fOIpKGzKnk+mUXqCibU=;
 b=LIPm7z1yNqMVcqAhe9Oy2q1xz5FAhIZJzfyy+4Mlj8lEcR4fm3tzJEDpPGpOVK/q88FP8V
 MglgIcVQvIrjKk8aFNjlQwJ6hzctKPzsWcFFBhdiePuu3nI+ujF8ddvIZdaK8JYDlJQYbS
 GHDysa4kEhJs88c1Wp5x9emYN2aXin4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-gvK146JdPYKxv9-X4wHFNw-1; Fri, 18 Feb 2022 11:39:51 -0500
X-MC-Unique: gvK146JdPYKxv9-X4wHFNw-1
Received: by mail-wr1-f71.google.com with SMTP id
 j8-20020adfc688000000b001e3322ced69so3772807wrg.13
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 08:39:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JIo4l+IcYek3ZlYe95hRJtd5fOIpKGzKnk+mUXqCibU=;
 b=MYBSdS8mY57YEdZmTP71/P1u74kB6zc/f7N2P8h4ftiNsfbThV8vaxqSLo9SyLZ0ax
 TNxs570818ho1vSU2eUbRd50cerELI+fw2A8nmPp/YiKtyUyiBdj5jzNLTNF7jUfTmb/
 eVgXOuaG/a7OO7OaLNWToVw/qoUnwrRCGR8VAHS5tankPlvipSc/EasEtFMpcfzv6j8P
 WSTle3TR1pKmvRXwqx1t2y+4yo3G5wGjDJPNGxLYeLWv1cqniMLIjKIHXLRK3uib6UYT
 lhv2yGaVqhPKw44Jvo3r9EbrAdQueA2vT67yIQM3aNw66xLSzw9TC+X/WbAVjfCVjUNn
 nbzA==
X-Gm-Message-State: AOAM532L1Ants7ldnOE5vydWSsKfIK8X+QbxmjpPzeLpPtVFHtdVxoo9
 R10z3u8BEQGgI2W7YOZFaY9k6lVdMsfjLPbxponPfzoSX6JJ2o1cbjPTNj+zuI2h+pFESlm4YBt
 w0vEEnqBJWIyHMh0=
X-Received: by 2002:a1c:a510:0:b0:37e:2645:2222 with SMTP id
 o16-20020a1ca510000000b0037e26452222mr11267061wme.26.1645202390241; 
 Fri, 18 Feb 2022 08:39:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjjrvyNpiV7ALEZOCgByd+kn0O8r1cLCnvtRwJhWJ6lj5nmgGjVhGowAW1ngDSmiFfHwzc9g==
X-Received: by 2002:a1c:a510:0:b0:37e:2645:2222 with SMTP id
 o16-20020a1ca510000000b0037e26452222mr11267040wme.26.1645202390078; 
 Fri, 18 Feb 2022 08:39:50 -0800 (PST)
Received: from localhost (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id d13sm22641457wri.38.2022.02.18.08.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 08:39:49 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v8 3/5] migration: Add zero-copy-send parameter for
 QMP/HMP for Linux
In-Reply-To: <20220201062901.428838-4-leobras@redhat.com> (Leonardo Bras's
 message of "Tue, 1 Feb 2022 03:29:01 -0300")
References: <20220201062901.428838-1-leobras@redhat.com>
 <20220201062901.428838-4-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 18 Feb 2022 17:39:48 +0100
Message-ID: <87k0dscenf.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras <leobras@redhat.com> wrote:
> Add property that allows zero-copy migration of memory pages
> on the sending side, and also includes a helper function
> migrate_use_zero_copy_send() to check if it's enabled.
>
> No code is introduced to actually do the migration, but it allow
> future implementations to enable/disable this feature.
>
> On non-Linux builds this parameter is compiled-out.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


