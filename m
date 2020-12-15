Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0572DA915
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 09:23:53 +0100 (CET)
Received: from localhost ([::1]:58186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp5ce-0001WG-AW
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 03:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kp5bp-000169-M6
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:23:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kp5bo-0005Jj-8H
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:23:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608020579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jU+V7i7YwNHIfhNe/JamTJkmME3wOuaoF1mDa3O7aC8=;
 b=J/xL/kLDzuvv5d+syvA/kW0qS7VmHVOU1VfPu72D+1TefjqdZ23ETYpSqhs/WATySODWyB
 SuAdiVpJ2VYRcWw3KObJ09OE1AaB4EFJKF0YsIFMiJNYMCoArlY1T+X2Xk2SOZsLA156rF
 1BTHzr9i85VygHGA2PesMew0eSLBDUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-dTfcjmvXOSqP8jsf-SZglw-1; Tue, 15 Dec 2020 03:22:57 -0500
X-MC-Unique: dTfcjmvXOSqP8jsf-SZglw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 137E210054FF;
 Tue, 15 Dec 2020 08:22:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4948D5C27C;
 Tue, 15 Dec 2020 08:22:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6E15E17532; Tue, 15 Dec 2020 09:22:51 +0100 (CET)
Date: Tue, 15 Dec 2020 09:22:51 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v4 01/32] cs4231: Get rid of empty property array
Message-ID: <20201215082251.5copzuuvj222qsmo@sirius.home.kraxel.org>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-2-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201211220529.2290218-2-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 11, 2020 at 05:04:58PM -0500, Eduardo Habkost wrote:
> An empty props array is unnecessary, we can just not call
> device_class_set_props().
> 
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: qemu-devel@nongnu.org

Patch added to audio queue.

thanks,
  Gerd


