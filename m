Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E464E27FD
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 14:45:25 +0100 (CET)
Received: from localhost ([::1]:33202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWILc-0005Fr-C1
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 09:45:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWIHB-0001f0-Hg
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:40:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWIH8-0003ib-1q
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647870044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dB7RXQWRVzgBI0NIeaCFhOgjQm4WSbR86DzUuMGwxpI=;
 b=h3D5we5HKeGh01F1QfB2ORdojX5Ee/FF7IveO1QWeMF4yqba3TU+tUS8ON8PgsYmyEuJ5m
 dvb89KuyMcUBthPQNMAoZS0OJOBvMzb1T7+2R6ix2uuWJAH0/rRZPIDdrBQVsgAFdPUxgv
 1UuQkYBLTCTg+0ZI7iWOb62XYDY/oys=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-RoOEhAYGPyiohvdbrbzMFw-1; Mon, 21 Mar 2022 09:40:41 -0400
X-MC-Unique: RoOEhAYGPyiohvdbrbzMFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F35992999B34;
 Mon, 21 Mar 2022 13:40:40 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C764400F721;
 Mon, 21 Mar 2022 13:40:40 +0000 (UTC)
Date: Mon, 21 Mar 2022 08:40:38 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 06/18] iotests: add qemu_img_json()
Message-ID: <20220321134038.4t4dgrjtdhgeev5e@redhat.com>
References: <20220317234937.569525-1-jsnow@redhat.com>
 <20220317234937.569525-7-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220317234937.569525-7-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 07:49:25PM -0400, John Snow wrote:
> qemu_img_json() is a new helper built on top of qemu_img() that tries to
> pull a valid JSON document out of the stdout stream.
> 
> In the event that the return code is negative (the program crashed), or
> the code is greater than zero and did not produce valid JSON output, the
> VerboseProcessError raised by qemu_img() is re-raised.
> 
> In the event that the return code is zero but we can't parse valid JSON,
> allow the JSON deserialization error to be raised.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 7057db0686..9d23066701 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -276,6 +276,38 @@ def ordered_qmp(qmsg, conv_keys=True):
>  def qemu_img_create(*args: str) -> subprocess.CompletedProcess[str]:
>      return qemu_img('create', *args)
>  
> +def qemu_img_json(*args: str) -> Any:
> +    """
> +    Run qemu-img and return its output as deserialized JSON.
> +
> +    :raise CalledProcessError:
> +        When qemu-img crashes, or returns a non-zero exit code without
> +        producing a valid JSON document to stdout.
> +    :raise JSONDecoderError:
> +        When qemu-img returns 0, but failed to produce a valid JSON document.
> +
> +    :return: A deserialized JSON object; probably a dict[str, Any].

Interesting choice to type the function as '-> Any', but document that
we expect a more specific '-> dict[str, Any]' for our known usage of
qemu-img.  But it makes sense to me (in case a future qemu-img
--output=json produces something that is JSON but not a dict).

> +    """
> +    try:
> +        res = qemu_img(*args, combine_stdio=False)
> +    except subprocess.CalledProcessError as exc:
> +        # Terminated due to signal. Don't bother.
> +        if exc.returncode < 0:
> +            raise
> +
> +        # Commands like 'check' can return failure (exit codes 2 and 3)
> +        # to indicate command completion, but with errors found. For
> +        # multi-command flexibility, ignore the exact error codes and
> +        # *try* to load JSON.
> +        try:
> +            return json.loads(exc.stdout)
> +        except json.JSONDecodeError:
> +            # Nope. This thing is toast. Raise the /process/ error.
> +            pass
> +        raise
> +
> +    return json.loads(res.stdout)

The comments were very helpful.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


