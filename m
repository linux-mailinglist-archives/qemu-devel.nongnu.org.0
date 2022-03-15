Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC8F4D949D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 07:31:33 +0100 (CET)
Received: from localhost ([::1]:47598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU0iR-0002J8-Pv
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 02:31:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nU0eP-00082T-MR
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:27:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nU0eN-0006Ph-J2
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647325637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cY+UblOqjryyS4IqLw8PwoZeu80HdrKnIGZxRMT2oMs=;
 b=G8oEUBr0HIjNpc8NqMu88zu4I2MDc+qhgBp9XtssBsnVgtiqy2RXlhSa1Ec9n3N6V8YoWy
 O5ExKdk2nvXF7sfWHgB7fQxO9fP4TDeWzBd8Zt6QImQoOwDpTks9pTSP8WTeJWBLnYtYFe
 7FAdnwY+Oiyfvy3fJzCF4LDYYddLLGc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-JOpNK-ccPQSDGlJBa5liaw-1; Tue, 15 Mar 2022 02:27:12 -0400
X-MC-Unique: JOpNK-ccPQSDGlJBa5liaw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E5DC101AA4A;
 Tue, 15 Mar 2022 06:27:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A97A2156A4F;
 Tue, 15 Mar 2022 06:27:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DACBC18003A2; Tue, 15 Mar 2022 07:27:08 +0100 (CET)
Date: Tue, 15 Mar 2022 07:27:08 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Volunteer to maintain Darwin-based hosts
 support
Message-ID: <20220315062708.p2xgxda46wou4uom@sirius.home.kraxel.org>
References: <20220314202738.33142-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220314202738.33142-1-philippe.mathieu.daude@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Joelle van Dyne <j@getutm.app>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 09:27:38PM +0100, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> While I am not an experienced Darwin OS user, I now have to
> use a macOS based workstation and alike CI, meaning I should
> easily spot regressions and test fixes. I therefore volunteer
> to collect Darwin related patches and keep QEMU in good state
> on macOS, and to some extent iOS.
> 
> Cc: Joelle van Dyne <j@getutm.app>
> Cc: Alexander Graf <agraf@csgraf.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Cameron Esfahani <dirty@apple.com>
> Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
> Cc: Roman Bolshakov <r.bolshakov@yadro.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>


