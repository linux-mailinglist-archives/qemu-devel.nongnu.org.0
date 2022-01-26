Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1169249D468
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 22:21:51 +0100 (CET)
Received: from localhost ([::1]:39196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCpji-0007YK-3X
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 16:21:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpiQ-0006IV-CG
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:20:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpiO-00074E-6G
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:20:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643232021;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCRbtpjNkFd/RGHWdRSa1+MxblaKGUk9KI5M1rtMc7s=;
 b=dn8BgBBdceG0quO4R4KrhthsanX4KdSGWlPCBzrIbPt4CRn9F/fDnlm2Hpf6GT6hf2S+Th
 gb2DHAn1xDNULPLdDhnmhBpWX7T8uSDZJ2uzy0SQ5ltw08d09ZYNrZGQr/zNyUsUj8u2TA
 XUJUubxz8yrkUkUqS5yEVECt5H6ENL4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-QmrlME5hP_m2MxNeafNs0w-1; Wed, 26 Jan 2022 16:20:20 -0500
X-MC-Unique: QmrlME5hP_m2MxNeafNs0w-1
Received: by mail-wm1-f69.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso481861wme.5
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CCRbtpjNkFd/RGHWdRSa1+MxblaKGUk9KI5M1rtMc7s=;
 b=AExg9L3vCjVB7lqG93NoSiKzAYiEpjA93vvq7Z9NgOjrNc9Sk9efWMylbhLIZrmCK7
 sDq5iNYsuSX/kqW2SRVjgClhmBGojo5AlAkQyvNVZ7USQwjBaWHOC12iWwLHV2RfpJ7+
 jRD5iC63diArLFHlSn/bMvJ/e+WCb9NmbtSMPfulNw3viF3Pv4RekfGXOIjtHPJ551Z8
 qA8juvYHjC1qKjOh2kOyT6FDkq76rJDD9FwotUg/STrwvFDl37yeskUgAQdVcUErD8Qs
 ecQHl1/0tL1qhSItHDe+TLVdXpQywExS1z3en6MyBxqdRc1qmTmXaG74OpcnB/7O7jK4
 BxkQ==
X-Gm-Message-State: AOAM5308PA410CXhp7mX5ALX1kXzRDiIOfpckC6KiARWP0efxTJNnN8t
 KxFrKOUmhNq7IJxWBgMyVSvYoAnLwAP4C5URBoq7l3dxYtLElQW71DIpYvkC/DWTdR9CUMJtsFU
 fQRLDUcDmP3RuKLs=
X-Received: by 2002:a05:600c:4282:: with SMTP id
 v2mr9039431wmc.78.1643232018632; 
 Wed, 26 Jan 2022 13:20:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNZKpQdvMjQWn6ddHM5aL6nHWK8pEqgU/blalDBLdjDphMOx6b1+UUrhmSU1VlulWQPSCQ7A==
X-Received: by 2002:a05:600c:4282:: with SMTP id
 v2mr9039416wmc.78.1643232018462; 
 Wed, 26 Jan 2022 13:20:18 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id h18sm442913wro.9.2022.01.26.13.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 13:20:18 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] migration: Don't return for postcopy_send_discard_bm_ram()
In-Reply-To: <20211230160525.462185-1-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 30 Dec 2021 17:05:25
 +0100")
References: <20211230160525.462185-1-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 26 Jan 2022 22:20:17 +0100
Message-ID: <87lez2mbxq.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> postcopy_send_discard_bm_ram() always return zero. Since it can't
> fail, simplify and do not return anything.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Based-on: <20211224065000.97572-1-peterx@redhat.com>

And here, I learn to read Based-on:

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


