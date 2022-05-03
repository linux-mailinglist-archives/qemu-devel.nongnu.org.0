Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D115189E7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:28:23 +0200 (CEST)
Received: from localhost ([::1]:52650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlvNu-0006R7-R4
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nlvLY-0003F2-MP
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:25:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nlvLX-0007yv-8P
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:25:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651595154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wSid6NlzjLRy1Pnz2TftV9xb5FuesFnfr5XrYly85bM=;
 b=huytnVrRplpN4cGuI8gi2LVimq6O/p7NEYYk04f2ABfdykkWPtUCZ+1TOSdilu25DedkUB
 EnUlUnLbAVk9B+sCs/7y1VYnBzQNM05jrC3kURwqeAnFCyJd53YD+P/G/mCNS5q+upeDXx
 /3SI/ZksI/7oX3lb3ANehCLqHm5mEIo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-Mt6sC_yQNH6hAkakbXUE5g-1; Tue, 03 May 2022 12:25:37 -0400
X-MC-Unique: Mt6sC_yQNH6hAkakbXUE5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83F3A1014A68;
 Tue,  3 May 2022 16:25:36 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9EC640CFD19;
 Tue,  3 May 2022 16:25:34 +0000 (UTC)
Date: Tue, 3 May 2022 11:25:33 -0500
From: Eric Blake <eblake@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 8/8] qapi: Stop using whitespace for alignment in
 comments
Message-ID: <20220503162533.bjdgj5ggp4ipqeqw@redhat.com>
References: <20220503073737.84223-1-abologna@redhat.com>
 <20220503073737.84223-9-abologna@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503073737.84223-9-abologna@redhat.com>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 03, 2022 at 09:37:37AM +0200, Andrea Bolognani wrote:
> Perfectly aligned things look pretty, but keeping them that
> way as the schema evolves requires churn, and in some cases
> newly-added lines are not aligned properly.
> 
> Overall, trying to align things is just not worth the trouble.

I'm in favor of commiting 7+8 squashed as a single patch.  7 alone is
indeed a churn magnet, so I'm either for stopping the series at 6, or
going all the way to 8 via a single additional step.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


