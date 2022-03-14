Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F7A4D8E79
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 21:51:57 +0100 (CET)
Received: from localhost ([::1]:47696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTrfX-0007oV-Rs
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 16:51:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nTred-000748-1p
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 16:50:59 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:55979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nTreb-0003uj-9C
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 16:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=daqXwQO0H2ANzWpwaQVWwcfA8cHw4oT9JYT14NDFgx4=; b=vw27OknIJX0HZPrlBfWXtfyy9w
 vIUgleuzKueRme0VqbI2VLFT1ba+JmrnNsAs/rIiVNSh7LqNr3Qm22SVXORQH3JJsZTq8vepYBhLp
 lOqpQyQftKOULJLfkRDM2jBZFddjbacR5+LY7FKHBc0QqOq3OcHQQUfBwabwSSMCFXUla0JwrwCsI
 FWYkMfpOgRaBWUEn4KqAhbXFHGGWsi+LAQz0RCr3HH1Z1LRD6MC8xVBXHtjiRRTcX2V2RvJ4qA0WT
 Cf/Dck5jFugOUgjFJMYw8JchOODSKf6BIuQMP/fPosp/vJmltSSeOd9rrGNK5buU5in0W7g1k9YvH
 ZIkFqW3RMXQd1SQGKDpZGfQCKdIEOMlNa7+DpJFWqf0bdAlFpJMUzHs4T5kPkoDXRv45rW8fTKBhr
 K65IBExxaosOHnYNznPoHelUj0ZU0W46UlNAtjZHfUMEBNCeMlWGGNQKciMl2sKW8rLefAdpnVafu
 N5I4yNgS4paE/684uGdUcp6V8SxIwaauIxTwF9YOponTk1PcoN/o18EJ0vjFkS9b8DZTC7JEyhm4b
 suXk6p/16wLe5GZeJlop744zB3QNgH3QEbyhIp7mRFH6skWCT0C0EshhulNPLDIFugNQoAmV4gMT0
 eYAQ1OJZ2ybsnZvwrBy5OjN+Iz3kE46X7Ay2OAOp8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?=
 <philippe.mathieu.daude@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?ISO-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Joelle van Dyne <j@getutm.app>
Subject: Re: [PATCH] MAINTAINERS: Volunteer to maintain Darwin-based hosts
 support
Date: Mon, 14 Mar 2022 21:50:53 +0100
Message-ID: <7959250.nhsyLb42Q1@silver>
In-Reply-To: <20220314202738.33142-1-philippe.mathieu.daude@gmail.com>
References: <20220314202738.33142-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Montag, 14. M=E4rz 2022 21:27:38 CET Philippe Mathieu-Daud=E9 wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> While I am not an experienced Darwin OS user, I now have to
> use a macOS based workstation and alike CI, meaning I should
> easily spot regressions and test fixes. I therefore volunteer
> to collect Darwin related patches and keep QEMU in good state
> on macOS, and to some extent iOS.
>=20
> Cc: Joelle van Dyne <j@getutm.app>
> Cc: Alexander Graf <agraf@csgraf.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Cameron Esfahani <dirty@apple.com>
> Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
> Cc: Roman Bolshakov <r.bolshakov@yadro.com>
> Cc: Daniel P. Berrang=E9 <berrange@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f2e9ce1da2..caea42c259 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -548,6 +548,12 @@ F: include/*/*win32*
>  X: qga/*win32*
>  F: qemu.nsi
>=20
> +Darwin (macOS, iOS)

Right now that's macOS only, so it should be:

Darwin (macOS)

Except of that:

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Thanks!

Best regards,
Christian Schoenebeck

> +M: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> +S: Odd Fixes
> +F: .gitlab-ci.d/cirrus/macos-*
> +F: */*.m
> +
>  Alpha Machines
>  --------------
>  M: Richard Henderson <richard.henderson@linaro.org>
> @@ -2414,6 +2420,7 @@ F: audio/alsaaudio.c
>=20
>  Core Audio framework backend
>  M: Gerd Hoffmann <kraxel@redhat.com>
> +M: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>  R: Christian Schoenebeck <qemu_oss@crudebyte.com>
>  R: Akihiko Odaki <akihiko.odaki@gmail.com>
>  S: Odd Fixes
> @@ -2671,6 +2678,7 @@ F: util/drm.c
>=20
>  Cocoa graphics
>  M: Peter Maydell <peter.maydell@linaro.org>
> +M: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>  R: Akihiko Odaki <akihiko.odaki@gmail.com>
>  S: Odd Fixes
>  F: ui/cocoa.m



