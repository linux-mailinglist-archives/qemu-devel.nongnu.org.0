Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 519E95B083F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 17:14:48 +0200 (CEST)
Received: from localhost ([::1]:41334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVwlL-0006KO-Dk
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 11:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVwdj-0001yt-Ti
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:06:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVwdW-00057X-O1
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662563201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5pfiHCppaeX3e2p5UApj7G2a70NDC1s2DPm+AHd+Kss=;
 b=Ze7f7L7H++q5FVL3TLX5MNhE9QKiqhCAcDXsT0NjsEOVGivdKgXRuefaWgDyvV876ecGCu
 Q/W1nBeDpsLHhZsG8Oo0gLU8VYwOhXCxf56kEhGMf8SqNCyEpwYRqkSosboKc5pwIKtyrq
 IPBv6/EjI7x/K+k+vIE+M9HZ7cnMEVM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-XvJrVU05MGmdja5onW3W4g-1; Wed, 07 Sep 2022 11:06:38 -0400
X-MC-Unique: XvJrVU05MGmdja5onW3W4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99CC1185A794;
 Wed,  7 Sep 2022 15:06:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 660A81415102;
 Wed,  7 Sep 2022 15:06:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3D55821E6900; Wed,  7 Sep 2022 17:06:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <f4bug@amsat.org>,  Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,  qemu-devel@nongnu.org,  Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] audio: add help option (?) for -audiodev
References: <20220907142359.31827-1-cfontana@suse.de>
Date: Wed, 07 Sep 2022 17:06:36 +0200
In-Reply-To: <20220907142359.31827-1-cfontana@suse.de> (Claudio Fontana's
 message of "Wed, 7 Sep 2022 16:23:59 +0200")
Message-ID: <87fsh3usub.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Claudio Fontana <cfontana@suse.de> writes:

> add a simple help option for -audiodev, so users can do
>
> qemu -audiodev ?

The preferred form is actually '-audiodev help'.  The other one is
deprecated.  Recommend to stay away from it even in commit messages.

>
> to get the list of drivers available.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  audio/audio.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 4f4bb10cce..bd8c18c3cd 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -32,6 +32,7 @@
>  #include "qapi/qapi-visit-audio.h"
>  #include "qemu/cutils.h"
>  #include "qemu/module.h"
> +#include "qemu/help_option.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/replay.h"
>  #include "sysemu/runstate.h"
> @@ -2105,10 +2106,29 @@ static void audio_validate_opts(Audiodev *dev, Error **errp)
>      }
>  }
>  
> +static void audio_help(void)
> +{
> +    int i;
> +
> +    printf("Available audiodev types:\n");
> +    printf("none\n");
> +
> +    for (i = 0; audio_prio_list[i]; i++) {
> +        audio_driver *driver = audio_driver_lookup(audio_prio_list[i]);
> +        if (driver) {
> +            printf("%s\n", driver->name);
> +        }
> +    }
> +}
> +
>  void audio_parse_option(const char *opt)
>  {
>      Audiodev *dev = NULL;
>  
> +    if (is_help_option(opt)) {
> +        audio_help();
> +        exit(0);
> +    }
>      Visitor *v = qobject_input_visitor_new_str(opt, "driver", &error_fatal);
>      visit_type_Audiodev(v, NULL, &dev, &error_fatal);
>      visit_free(v);


