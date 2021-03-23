Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336DC345F28
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:14:06 +0100 (CET)
Received: from localhost ([::1]:54814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgrF-0004fc-0q
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOgq5-0004Cu-Pi
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:12:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOgq3-00068t-32
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616505170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PX6qiH1nNyW3wXcY3NQsi6GsQN1VgN0rh3t3Wn0to04=;
 b=gLwHwXKl2UXPDE1b1fzznZGerUCsx35OUY7n25JLLytsokMSLnG2fvyYUP5XsIp7GYLfwP
 THhIUrKeh+fp9OW63hY5PUbYkJVPE82NGBQyoTrUi0FvLqrrSc4JzlRGQasQmquO8I1k43
 S0QF3DxxVFShJ2YU/WCMB0AY+XmNmWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-jHQ8Z4XCMU6tVUKNyStdKg-1; Tue, 23 Mar 2021 09:12:48 -0400
X-MC-Unique: jHQ8Z4XCMU6tVUKNyStdKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 018EB10CE7AB;
 Tue, 23 Mar 2021 13:12:24 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E3A410023AF;
 Tue, 23 Mar 2021 13:12:23 +0000 (UTC)
Subject: Re: [PATCH 04/28] tests/qapi-schema: Belatedly update comment on
 alternate clash
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-5-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <290c9057-343b-34f2-0ea4-1d63ba0d3bdb@redhat.com>
Date: Tue, 23 Mar 2021 09:12:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323094025.3569441-5-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 5:40 AM, Markus Armbruster wrote:
> Commit 0426d53c65 "qapi: Simplify visiting of alternate types"
> eliminated the implicit alternate enum, but neglected to update a
> comment about it in a test.  Do that now.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>   tests/qapi-schema/alternate-clash.err  | 2 +-
>   tests/qapi-schema/alternate-clash.json | 5 +----
>   2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/qapi-schema/alternate-clash.err b/tests/qapi-schema/alternate-clash.err
> index f58b977f7b..0fe02f2c99 100644
> --- a/tests/qapi-schema/alternate-clash.err
> +++ b/tests/qapi-schema/alternate-clash.err
> @@ -1,2 +1,2 @@
>   alternate-clash.json: In alternate 'Alt1':
> -alternate-clash.json:7: branch 'a_b' collides with branch 'a-b'
> +alternate-clash.json:4: branch 'a_b' collides with branch 'a-b'
> diff --git a/tests/qapi-schema/alternate-clash.json b/tests/qapi-schema/alternate-clash.json
> index 9a59b88ced..039c4be658 100644
> --- a/tests/qapi-schema/alternate-clash.json
> +++ b/tests/qapi-schema/alternate-clash.json
> @@ -1,8 +1,5 @@
>   # Alternate branch name collision
>   # Reject an alternate that would result in a collision in generated C
> -# names (this would try to generate two enum values 'ALT1_KIND_A_B').
> -# TODO: In the future, if alternates are simplified to not generate
> -# the implicit Alt1Kind enum, we would still have a collision with the
> -# resulting C union trying to have two members named 'a_b'.
> +# names (this would try to generate two union members named 'a_b').
>   { 'alternate': 'Alt1',
>     'data': { 'a-b': 'bool', 'a_b': 'int' } }
> 


