Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F052702E90
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:41:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXmX-0000aI-UN; Mon, 15 May 2023 08:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pyXmD-0000X3-9D
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:58:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pyXm5-00081e-HP
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684155480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6rvFrdJNHKmMhb0LkDMhx9NCVQ1cHu5APZOUTN3CZMU=;
 b=XA49dIm39/3ryVOhy5NgypAa0VDcyjx6NfCPkLi+x3dzPifLIJoQEKLjOVCOEMqEqbJbm+
 IZ5c28Vjp1suyEuznc+IWH9xx2w6v2e43GqN39at1ldj1VWib5k7Uibwk9JHXxGDd5S8d1
 EQ8MLzZfbqxOCdxc7NtI1+pC7tbedMw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-AMmKEvgDMrO-B2o6OC2lCw-1; Mon, 15 May 2023 08:57:57 -0400
X-MC-Unique: AMmKEvgDMrO-B2o6OC2lCw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C98F9185A7A2;
 Mon, 15 May 2023 12:57:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66495400F5A;
 Mon, 15 May 2023 12:57:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D27D521E6806; Mon, 15 May 2023 14:57:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Markus Armbruster <armbru@redhat.com>,  Eric
 Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 2/2] docs/interop: Delete qmp-intro.txt
References: <20230511121553.3356127-1-peter.maydell@linaro.org>
 <20230511121553.3356127-3-peter.maydell@linaro.org>
Date: Mon, 15 May 2023 14:57:54 +0200
In-Reply-To: <20230511121553.3356127-3-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 11 May 2023 13:15:53 +0100")
Message-ID: <87o7mlwy3x.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Maydell <peter.maydell@linaro.org> writes:

> qmp-intro.txt is quite small and provides very little information
> that isn't already in the documentation elsewhere.  Fold the example
> command lines into qemu-options.hx, and delete the now-unneeded plain
> text document.

A friendly introduction can be worth some redundancy.  But I can't see
how to fit it into our greater doc framework, and standalone plaintext
documents likely isn't where someone in need of a friendly intro would
look for one.  Since I have nothing better to offer, no objection.

> While we're touching the qemu-options.hx documentation text,
> wordsmith it a little bit and improve the rST formatting.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2: removed a trailing space spotted by Eric
> ---
>  docs/interop/qmp-intro.txt | 88 --------------------------------------
>  qemu-options.hx            | 28 +++++++++---
>  2 files changed, 22 insertions(+), 94 deletions(-)
>  delete mode 100644 docs/interop/qmp-intro.txt
>
> diff --git a/docs/interop/qmp-intro.txt b/docs/interop/qmp-intro.txt
> deleted file mode 100644
> index 1c745a7af04..00000000000
> --- a/docs/interop/qmp-intro.txt
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -                          QEMU Machine Protocol
> -                          =====================
> -
> -Introduction
> -------------
> -
> -The QEMU Machine Protocol (QMP) allows applications to operate a
> -QEMU instance.
> -
> -QMP is JSON[1] based and features the following:
> -
> -- Lightweight, text-based, easy to parse data format
>
> -- Asynchronous messages support (ie. events)
> -- Capabilities Negotiation
> -
> -For detailed information on QMP's usage, please, refer to the following files:
> -
> -o qmp-spec.txt      QEMU Machine Protocol current specification
> -o qemu-qmp-ref.html QEMU QMP commands and events (auto-generated at build-time)
> -
> -[1] https://www.json.org
> -
> -Usage
> ------
> -
> -You can use the -qmp option to enable QMP. For example, the following
> -makes QMP available on localhost port 4444:
> -
> -$ qemu [...] -qmp tcp:localhost:4444,server=on,wait=off
> -
> -However, for more flexibility and to make use of more options, the -mon
> -command-line option should be used. For instance, the following example
> -creates one HMP instance (human monitor) on stdio and one QMP instance
> -on localhost port 4444:
> -
> -$ qemu [...] -chardev stdio,id=mon0 -mon chardev=mon0,mode=readline \
> -             -chardev socket,id=mon1,host=localhost,port=4444,server=on,wait=off \
> -             -mon chardev=mon1,mode=control,pretty=on
> -
> -Please, refer to QEMU's manpage for more information.
> -
> -Simple Testing
> ---------------
> -
> -To manually test QMP one can connect with telnet and issue commands by hand:
> -
> -$ telnet localhost 4444
> -Trying 127.0.0.1...
> -Connected to localhost.
> -Escape character is '^]'.
> -{
> -    "QMP": {
> -        "version": {
> -            "qemu": {
> -                "micro": 0,
> -                "minor": 0,
> -                "major": 3
> -            },
> -            "package": "v3.0.0"
> -        },
> -        "capabilities": [
> -            "oob"
> -        ]
> -    }
> -}
> -
> -{ "execute": "qmp_capabilities" }
> -{
> -    "return": {
> -    }
> -}
> -
> -{ "execute": "query-status" }
> -{
> -    "return": {
> -        "status": "prelaunch", 
> -        "singlestep": false, 
> -        "running": false
> -    }
> -}
> -
> -Please refer to docs/interop/qemu-qmp-ref.* for a complete command
> -reference, generated from qapi/qapi-schema.json.
> -
> -QMP wiki page
> --------------
> -
> -https://wiki.qemu.org/QMP
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 42b9094c10f..920f9640155 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4170,26 +4170,42 @@ DEF("qmp", HAS_ARG, QEMU_OPTION_qmp, \
>      QEMU_ARCH_ALL)
>  SRST
>  ``-qmp dev``
> -    Like -monitor but opens in 'control' mode.
> +    Like ``-monitor`` but opens in 'control' mode. For example, to make
> +    QMP available on localhost port 4444::
> +
> +        -qmp tcp:localhost:4444,server=on,wait=off
> +
> +    Not all options are configurable via this syntax; for maximum
> +    flexibility use the ``-mon`` option and an accompanying ``-chardev``.
> +
>  ERST
>  DEF("qmp-pretty", HAS_ARG, QEMU_OPTION_qmp_pretty, \
>      "-qmp-pretty dev like -qmp but uses pretty JSON formatting\n",
>      QEMU_ARCH_ALL)
>  SRST
>  ``-qmp-pretty dev``
> -    Like -qmp but uses pretty JSON formatting.
> +    Like ``-qmp`` but uses pretty JSON formatting.
>  ERST
>  
>  DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
>      "-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]\n", QEMU_ARCH_ALL)
>  SRST
>  ``-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]``
> -    Setup monitor on chardev name. ``mode=control`` configures 
> -    a QMP monitor (a JSON RPC-style protocol) and it is not the
> -    same as HMP, the human monitor that has a "(qemu)" prompt.
> -    ``pretty`` is only valid when ``mode=control``, 
> +    Set up a monitor connected to the chardev ``name``.
> +    QEMU supports two monitors: the Human Monitor Protocol
> +    (HMP; for human interaction), and the QEMU Monitor Protocol
> +    (QMP; a JSON RPC-style protocol).

We can't quite decide whether the M in QMP means "machine" or "monitor":

    $ git-grep -i "machine protocol"
    docs/about/deprecated.rst:QEMU Machine Protocol (QMP) commands
    docs/about/removed-features.rst:QEMU Machine Protocol (QMP) commands
    docs/interop/qmp-spec.rst:QEMU Machine Protocol Specification
    docs/interop/qmp-spec.rst:The QEMU Machine Protocol (QMP) is a JSON-based

    $ git-grep -i "monitor protocol"
    docs/about/deprecated.rst:Human Monitor Protocol (HMP) commands
    docs/about/removed-features.rst:Human Monitor Protocol (HMP) commands
    docs/devel/qapi-code-gen.rst:format for the QEMU Monitor Protocol (QMP) for controlling qemu, as
    docs/sphinx/qmp_lexer.py:# QEMU Monitor Protocol Lexer Extension
    docs/system/introduction.rst::ref:`Human Monitor Protocol (HMP)<QEMU monitor>` that allows you to
    docs/system/introduction.rst:state. The :ref:`QEMU Monitor Protocol<QMP Ref>` (QMP) is a well
    docs/tools/qemu-storage-daemon.rst:Commands can be sent over a QEMU Monitor Protocol (QMP) connection. See the
    python/qemu/qmp/__init__.py:QEMU Monitor Protocol (QMP) development library & tooling.
    python/qemu/qmp/legacy.py:    Provide an API to connect to QEMU via QEMU Monitor Protocol (QMP)
    qemu-options.hx:    QEMU supports two monitors: the Human Monitor Protocol
    qemu-options.hx:    (HMP; for human interaction), and the QEMU Monitor Protocol

Not this patch's fault.

> +    The default is HMP; ``mode=control`` selects QMP instead.
> +    ``pretty`` is only valid when ``mode=control``,
>      turning on JSON pretty printing to ease
>      human reading and debugging.
> +
> +    For example::
> +
> +      -chardev socket,id=mon1,host=localhost,port=4444,server=on,wait=off \
> +      -mon chardev=mon1,mode=control,pretty=on
> +
> +    enables the QMP monitor on localhost port 4444 with pretty-printing.
>  ERST
>  
>  DEF("debugcon", HAS_ARG, QEMU_OPTION_debugcon, \

Reviewed-by: Markus Armbruster <armbru@redhat.com>


