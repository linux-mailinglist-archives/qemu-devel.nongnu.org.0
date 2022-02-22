Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 420BA4BFDDE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:57:17 +0100 (CET)
Received: from localhost ([::1]:54596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXXQ-0008Vj-C4
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:57:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMWga-0005T5-0R
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:02:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMWgW-00013x-U9
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645542156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+mXL52TwHIfl1yN9ScX8/3iiOuw0rlkUPVQmY6csyos=;
 b=GU/VBLQrUb/IH3Pq0KWQEOLAPBwkRVN6zPrOMN+ZKqwesQ5/ILkiuYSzERCIoR1/lZNAuZ
 x395HjLXXXBgbim/hULaF3Bfm154On1N0yqyP4nDMVA86ruABVr5qualF/41pdVqV0bD7S
 H2KEFcwGrIFUlmMWTpn+Zm/2RPFDz+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-0lgKAd7GMJaaHn398ZKGjQ-1; Tue, 22 Feb 2022 10:02:35 -0500
X-MC-Unique: 0lgKAd7GMJaaHn398ZKGjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0177218766D3;
 Tue, 22 Feb 2022 15:02:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF0A47C043;
 Tue, 22 Feb 2022 15:02:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3317B21608D6; Tue, 22 Feb 2022 16:02:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Fabian Holler <fabian.holler@simplesurance.de>
Subject: Re: [PATCH] schemas: fix: wrong field name 'data' in client
 snapshot msg examples
References: <20220222141431.43559-1-fabian.holler@simplesurance.de>
Date: Tue, 22 Feb 2022 16:02:32 +0100
In-Reply-To: <20220222141431.43559-1-fabian.holler@simplesurance.de> (Fabian
 Holler's message of "Tue, 22 Feb 2022 15:14:31 +0100")
Message-ID: <87bkyzkkqf.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recommend to tweak the title to something like

    qapi/migration: Fix examples ...

Fabian Holler <fabian.holler@simplesurance.de> writes:

> The examples for the snapshot-* commands documented that arguments for

document

> the commands must be passed in a 'data' field.
> This is wrong, passing them in a "data" field results in
> the error:
>   {"error": {"class": "GenericError", "desc": "QMP input member 'data'
> 		       is unexpected"}}
>
> Arguments are expected to be passed in an field called "arguments".
> Replace "data" with "arguments" in the snapshot-* command examples.
>
> Signed-off-by: Fabian Holler <fabian.holler@simplesurance.de>
> ---
>  qapi/migration.json | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 5975a0e104..1c6296897d 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json

Please also fix this one:

   # Example:
   #   {"command": "calc-dirty-rate", "data": {"calc-time": 1,
   #                                           'sample-pages': 512} }
   #

> @@ -1888,7 +1888,7 @@
>  # Example:
>  #
>  # -> { "execute": "snapshot-save",
> -#      "data": {
> +#      "arguments": {
>  #         "job-id": "snapsave0",
>  #         "tag": "my-snap",
>  #         "vmstate": "disk0",
> @@ -1949,7 +1949,7 @@
>  # Example:
>  #
>  # -> { "execute": "snapshot-load",
> -#      "data": {
> +#      "arguments": {
>  #         "job-id": "snapload0",
>  #         "tag": "my-snap",
>  #         "vmstate": "disk0",
> @@ -2002,7 +2002,7 @@
>  # Example:
>  #
>  # -> { "execute": "snapshot-delete",
> -#      "data": {
> +#      "arguments": {
>  #         "job-id": "snapdelete0",
>  #         "tag": "my-snap",
>  #         "devices": ["disk0", "disk1"]

Good catch!


