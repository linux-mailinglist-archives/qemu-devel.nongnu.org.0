Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE7E5F755F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 10:37:34 +0200 (CEST)
Received: from localhost ([::1]:56924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogirN-0006dR-BM
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 04:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogiXz-0003XX-Lv
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 04:17:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogiXv-000701-7V
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 04:17:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665130646;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=I0wPSyCI9am0O4F6Wi+Kf0NrFWeoJBB8IQq7rp2YmPQ=;
 b=R2GJ879gsqI8tkAXeR99Ja7JGakT+rcVBPSxauFB7442HxvIumNa8Mltl0dThf5DDgJ+6I
 rVICRBDzlSvZBAFr5ASff5CSI3cc6EM+3pJ70VrFTWR0q4qAnfEHmCh8ufmgklcUz82xCg
 KoI+WVZTqboRzJN2kc8S13TIVGdavPE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-1ZwsPBECN8SvW0t0TJ9RlQ-1; Fri, 07 Oct 2022 04:17:22 -0400
X-MC-Unique: 1ZwsPBECN8SvW0t0TJ9RlQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E08D185A78B;
 Fri,  7 Oct 2022 08:17:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A57C353593C;
 Fri,  7 Oct 2022 08:17:19 +0000 (UTC)
Date: Fri, 7 Oct 2022 09:17:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru, armbru@redhat.com,
 michael.roth@amd.com, vsementsov@yandex-team.ru
Subject: Re: [PATCH v1] qapi/qmp: Add timestamps to qmp command responses
Message-ID: <Yz/gh9JppXf408+2@redhat.com>
References: <20221007075208.175614-1-den-plotnikov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221007075208.175614-1-den-plotnikov@yandex-team.ru>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 07, 2022 at 10:52:08AM +0300, Denis Plotnikov wrote:
> Add "start" & "end" time values to qmp command responses.
> 
> These time values are added to let the qemu management layer get the exact
> command execution time without any other time variance which might be brought by
> other parts of management layer or qemu internals. This is particulary useful
> for the management layer logging for later problems resolving.
> 
> Example of result:
> 
>     ./qemu/scripts/qmp/qmp-shell /tmp/qmp.socket
> 
>     (QEMU) query-status
>     {"end": {"seconds": 1650367305, "microseconds": 831032},
>      "start": {"seconds": 1650367305, "microseconds": 831012},
>      "return": {"status": "running", "singlestep": false, "running": true}}
> 
> The responce of the qmp command contains the start & end time of
> the qmp command processing.
> 
> Suggested-by: Andrey Ryabinin <arbn@yandex-team.ru>
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> ---
> v0->v1:
>  - remove interface to control "start" and "end" time values: return timestamps unconditionally
>  - add description to qmp specification
>  - leave the same timestamp format in "seconds", "microseconds" to be consistent with events
>    timestamp
>  - fix patch description
> 
>  docs/interop/qmp-spec.txt | 20 ++++++++++++++++++--
>  qapi/qmp-dispatch.c       | 18 ++++++++++++++++++
>  2 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/interop/qmp-spec.txt b/docs/interop/qmp-spec.txt
> index b0e8351d5b261..d1cca8bc447ce 100644
> --- a/docs/interop/qmp-spec.txt
> +++ b/docs/interop/qmp-spec.txt
> @@ -158,7 +158,9 @@ responses that have an unknown "id" field.
>  
>  The format of a success response is:
>  
> -{ "return": json-value, "id": json-value }
> +{ "return": json-value, "id": json-value,
> +  "start": {"seconds": json-value, "microseconds": json-value},
> +  "end": {"seconds": json-value, "microseconds": json-value} }
>  
>   Where,
>  
> @@ -169,13 +171,21 @@ The format of a success response is:
>    command does not return data
>  - The "id" member contains the transaction identification associated
>    with the command execution if issued by the Client
> +- The "start" member contains the exact time of when the command has been
> +  stated to be processed. It is a fixed json-object with time in
> +  seconds and microseconds relative to the Unix Epoch (1 Jan 1970)

If I may make a suggestion

- The "start" member contains the exact time of when the server
  started executing the command. This excludes any time the
  command request spent queued, after reading it off the wire.

  It is a fixed json-object with time in seconds and microseconds
  relative to the Unix Epoch (1 Jan 1970)

> +- The "end" member contains the exact time of when the command has been
> +  finished to be processed. It is a fixed json-object with time in
> +  seconds and microseconds relative to the Unix Epoch (1 Jan 1970)

- The "end" member contains the exact time of when the server
  finished executing the command. This excludes any time the
  command response spent queued, waiting to be sent on the wire.

  It is a fixed json-object with time in seconds and microseconds
  relative to the Unix Epoch (1 Jan 1970)

> @@ -184,6 +194,12 @@ The format of an error response is:
>    not attempt to parse this message.
>  - The "id" member contains the transaction identification associated with
>    the command execution if issued by the Client
> +- The "start" member contains the exact time of when the command has been
> +  stated to be processed. It is a fixed json-object with time in
> +  seconds and microseconds relative to the Unix Epoch (1 Jan 1970)
> +- The "end" member contains the exact time of when the command has been
> +  finished to be processed. It is a fixed json-object with time in
> +  seconds and microseconds relative to the Unix Epoch (1 Jan 1970)

Same suggestion as above of course.


Could you also add something to tests/qtest/qmp-test.c to validate
that the start/end fields are present for command responses and
errors, and also validate that end > start as a sanity check.


IIUC, this change will transparently apply to the QEMU guest agent
too since your change looks to be in the shared code for QMP ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


