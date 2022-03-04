Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B684E4CCBE9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 03:43:44 +0100 (CET)
Received: from localhost ([::1]:36302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPxux-0004nr-Bd
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 21:43:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPxtA-0003eR-Iv
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 21:41:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPxt7-0004yt-8D
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 21:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646361708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nnwRdi9TyeZLUvduB9n93tSO407CZ8N15uFVdYEjv3I=;
 b=T534j6eTMo56EXXgjI6dEpkeB8kGqRRW0K/UGaEsEVYJIdFr0FPfS2Kq/JezeWYKhWMxK1
 Yz4W/Pp18wNkPESiD8AKB4r3KKXX7AU60DR/DOxsUQblsR285IDq0uqWIUq3/e/e9+wVYh
 LvJHEvTXfl9X61V7hcqRrygt4KoVb80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-wMQ8tPRINXyEFHcIrxttKg-1; Thu, 03 Mar 2022 21:41:44 -0500
X-MC-Unique: wMQ8tPRINXyEFHcIrxttKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F07FC801DDB;
 Fri,  4 Mar 2022 02:41:43 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 886B25DB80;
 Fri,  4 Mar 2022 02:41:40 +0000 (UTC)
Date: Thu, 3 Mar 2022 20:41:38 -0600
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 2/5] python/utils: add VerboseProcessError
Message-ID: <20220304024138.jenvh6ygkecxgtji@redhat.com>
References: <20220303205902.4106779-1-jsnow@redhat.com>
 <20220303205902.4106779-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303205902.4106779-3-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-378-f757a4
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 03, 2022 at 03:58:59PM -0500, John Snow wrote:
> This adds an Exception that extends the Python stdlib
> subprocess.CalledProcessError.
> 
> The difference is that the str() method of this exception also adds the
> stdout/stderr logs. In effect, if this exception goes unhandled, Python
> will print the output in a visually distinct wrapper to the terminal so
> that it's easy to spot in a sea of traceback information.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/utils/__init__.py | 36 +++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


