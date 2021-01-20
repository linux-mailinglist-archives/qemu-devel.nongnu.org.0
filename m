Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6582FD4DA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:06:04 +0100 (CET)
Received: from localhost ([::1]:39190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Fzf-0006cb-F3
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2Fv6-0002Yc-AD
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:01:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2Fuy-0004rU-Ap
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611158467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UXMfQnFXRGetMq3F6aRUHZuJJm8vuGDW1wRjUsHMF6A=;
 b=gNvoMIec/abuKqpp52m0dUkt9vYmjh9VBbgo2SU1OsoPGjg1f/MqHo8erhVOe++qnir1ZU
 tyMDNNCbAq0SOAbjp9BE5Bq3kIfoVe2kmftEpQQz5n5pBmpG7irzZ8kQgrDX5vnc4Wix/N
 UNajHtphY2rbW6nHO7ux5d195VUruyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-5yv-NQpBOwGH-X5RYm0WmQ-1; Wed, 20 Jan 2021 11:01:04 -0500
X-MC-Unique: 5yv-NQpBOwGH-X5RYm0WmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25A49100C626;
 Wed, 20 Jan 2021 16:01:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEC0A5C8AB;
 Wed, 20 Jan 2021 16:01:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 50AD31800600; Wed, 20 Jan 2021 17:01:01 +0100 (CET)
Date: Wed, 20 Jan 2021 17:01:01 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [RFC PATCH 1/2] scsi/utils: Add INVALID_PARAM_VALUE sense code
 definition
Message-ID: <20210120160101.nddbb5wjh47hvrj7@sirius.home.kraxel.org>
References: <20210118170308.282442-1-philmd@redhat.com>
 <20210118170308.282442-2-philmd@redhat.com>
 <505a6e2f-a07b-5e1f-a6d0-3d32b6388bb3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <505a6e2f-a07b-5e1f-a6d0-3d32b6388bb3@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > +/* Illegal request, Invalid value in parameter list */
> > +extern const struct SCSISense sense_code_INVALID_PARAM_VALUE;

> Pre-existing: the term 'illegal' is suspect in computer science (the
> code isn't breaking any laws);

Indeed.  It's named that way in the scsi specs though, and being
consistent with that is a reasonable thing too ...

take care,
  Gerd


