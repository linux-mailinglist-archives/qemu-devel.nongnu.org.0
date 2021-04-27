Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0D336C797
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 16:13:31 +0200 (CEST)
Received: from localhost ([::1]:41970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbOSw-0006vY-Q4
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 10:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lbOQy-00065T-Qm
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:11:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lbOQv-0001hJ-LV
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619532684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBJURaReEmjhdK9btWtxkKJyyAf4pUVclpTw1mBO6Bc=;
 b=PZXL29Uv23mvyj1W69KWhVG1bAeGBoAXVcrwnaADl1Jru+B7SlxeT/FO0XPBJqbJoWH9S6
 lpcEjtEHXKHpglhp5Gle3SM0/2WS1+oeDnrhADAatqepj0lYvypp2/BaR4vZAo+fP2h4nT
 WyFOfVSlKNGfRNBevr9LwvJ7HpYiWs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-UqRaMlU0NgiYtQC9yb-PYg-1; Tue, 27 Apr 2021 10:11:22 -0400
X-MC-Unique: UqRaMlU0NgiYtQC9yb-PYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66B7019253C4;
 Tue, 27 Apr 2021 14:11:20 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-176.ams2.redhat.com
 [10.36.113.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 623885D6D5;
 Tue, 27 Apr 2021 14:11:18 +0000 (UTC)
Date: Tue, 27 Apr 2021 16:11:15 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v3 02/13] hw/s390x: only build tod-tcg from the CONFIG_TCG
 build
Message-ID: <20210427161115.5555d301.cohuck@redhat.com>
In-Reply-To: <20210422115430.15078-3-cfontana@suse.de>
References: <20210422115430.15078-1-cfontana@suse.de>
 <20210422115430.15078-3-cfontana@suse.de>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Apr 2021 13:54:19 +0200
Claudio Fontana <cfontana@suse.de> wrote:

> this will allow in later patches to remove unneeded stubs
> in target/s390x.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/s390x/meson.build | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


