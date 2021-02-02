Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C00AD30BE73
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:42:58 +0100 (CET)
Received: from localhost ([::1]:55406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6v1F-0004Ph-Tf
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6v02-0003pq-KA
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:41:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6v00-0006Jb-Pv
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612269699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aC+NELjbKGwC/gy3uDliuX9w4Jq8pjoKGcUVjQWOUks=;
 b=UlcymGiswrPDHKBVVgEzj10X3ikUw3COty2El7jnrrujWlM+YSAyWMHLIUiLp2Ji/L7InW
 k9woXoerQP6zOgoMSHrUzkpmevjCCcZxkxSmJQ/mk3986pUkmt4TFiK9tms2o48IwFzSgc
 3GWxQoAY68EKn3EQHZV5QMijNt72NGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-r4yx483BMkqz0L8XyscVgQ-1; Tue, 02 Feb 2021 07:41:37 -0500
X-MC-Unique: r4yx483BMkqz0L8XyscVgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74F76804002;
 Tue,  2 Feb 2021 12:41:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFA0C5D9C6;
 Tue,  2 Feb 2021 12:41:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7130E113865F; Tue,  2 Feb 2021 13:41:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PULL 10/11] trace: document how to specify multiple --trace
 patterns
References: <20210201154703.180022-1-stefanha@redhat.com>
 <20210201154703.180022-11-stefanha@redhat.com>
 <d5e9b59a-f7df-5a7b-55bb-cc6066b18a70@eik.bme.hu>
 <20210201161352.GH13157@merkur.fritz.box>
 <cbab5846-b5d-d256-89d7-b2bf9f7c69f@eik.bme.hu>
 <20210201165445.GI13157@merkur.fritz.box>
 <32b015e1-f182-8557-72d1-6827e4f0a09b@redhat.com>
 <81fbad73-b911-cfb6-dc9f-142ccaee678f@eik.bme.hu>
Date: Tue, 02 Feb 2021 13:41:28 +0100
In-Reply-To: <81fbad73-b911-cfb6-dc9f-142ccaee678f@eik.bme.hu> (BALATON
 Zoltan's message of "Mon, 1 Feb 2021 18:39:49 +0100 (CET)")
Message-ID: <87v9babq13.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Mon, 1 Feb 2021, Paolo Bonzini wrote:
>> On 01/02/21 17:54, Kevin Wolf wrote:
>>>> How does this option parsing work? Would then multiple patterns
>>>> separated by
>>>> comma as in -trace pattern1,pattern2 also work?
>>> This would be interpreted as an implied "enable" option with a value of
>>> "pattern1,pattern2". I don't think anything splits that string at the
>>> comma, so it would look for a trace event matching that string.
>>
>> Even worse, it would be interpreted as "-trace
>> enable=pattern1,pattern2=on" (and raise a warning since recently).
>
> Not very intuitive... What would -trace
> enable=pattern1,enable=pattern2 do then?

Welcome to the QemuOpts swamp.  Bring your own mosquito net.

The argument of -trace is parsed with QemuOpts.

The option argument is specified in trace/control.c:

    QemuOptsList qemu_trace_opts = {
        .name = "trace",
        .implied_opt_name = "enable",
        .head = QTAILQ_HEAD_INITIALIZER(qemu_trace_opts.head),
        .desc = {
            {
                .name = "enable",
                .type = QEMU_OPT_STRING,
            },
            {
                .name = "events",
                .type = QEMU_OPT_STRING,
            },{
                .name = "file",
                .type = QEMU_OPT_STRING,
            },
            { /* end of list */ }
        },
    };

We generally refer to QemuOptsList by name.  This one's name is "trace".

The non-empty .desc[] enumerates the recognized parameters.
Additionally, special parameter "id" is recognized.

.implied_opt_name enables "omitted first key defaults to implied key"
sugar.  This is what makes "-trace PATTERN" shorthand for -trace
enable=PATTERN", where PATTERN contains neither '=' nor unescaped ','.

The QemuOpts parser parses an option argument string into a QemuOpts,
stores it for later use, and also returns it for immediate use.

Code can do whatever it wants with the stored parameters.  This is a
wellspring of inconsistency and confusion.

Let's look at the code for -trace.  In qemu_init(), we have:

                case QEMU_OPTION_trace:
                    trace_opt_parse(optarg);
                    break;

This calls trace_opt_parse() for every -trace, in order.  @optarg is the
argument string.

    void trace_opt_parse(const char *optarg)
    {
        QemuOpts *opts = qemu_opts_parse_noisily(qemu_find_opts("trace"),
                                                 optarg, true);

qemu_opts_parse_noisily() parses @optarg into a QemuOpts, stores it for
later use, and also returns it for immediate use.

        if (!opts) {
            exit(1);
        }

        if (qemu_opt_get(opts, "enable")) {
            trace_enable_events(qemu_opt_get(opts, "enable"));
        }

Pass the last enable=PATTERN in @optarg to trace_enable_events().

        trace_init_events(qemu_opt_get(opts, "events"));

Pass the the last events=FILENAME to trace_init_events(), which parses
patterns from file FILENAME and passes them to trace_enable_events().

Non-last enable=... ane events=... are silently ignored.

        init_trace_on_startup = true;

Set a flag for trace_init_file().

        qemu_opts_del(opts);

Delete the stored QemuOpts.  We'll get back to this in jiffie.

    }

Later in qemu_init(), we call trace_init_file().  Here it is:

    void trace_init_file(void)
    {
        QemuOpts *opts = qemu_find_opts_singleton("trace");

This gets the first QemuOpts stored in the QemuOptsList named "trace"
without "id".  If there is none, it creates an empty one for us.

Since trace_opt_parse() deletes, this always creates an empty one.

        const char *file = qemu_opt_get(opts, "file");

This is always null.

    #ifdef CONFIG_TRACE_SIMPLE
        st_set_trace_file(file);
        if (init_trace_on_startup) {
            st_set_trace_file_enabled(true);
        }
    #elif defined CONFIG_TRACE_LOG
        /*
         * If both the simple and the log backends are enabled, "--trace file"
         * only applies to the simple backend; use "-D" for the log
         * backend. However we should only override -D if we actually have
         * something to override it with.
         */
        if (file) {
            qemu_set_log_filename(file, &error_fatal);
        }
    #else
        if (file) {
            fprintf(stderr, "error: --trace file=...: "
                    "option not supported by the selected tracing backends\n");
            exit(1);
        }
    #endif
    }

Bug: option parameter "file" has no effect.  I suspect this was broken
in commit 92eecfff32 "trace: remove argument from trace_init_file",
2020-11-11.

And now I'm ready to answer your question:

    -trace enable=pattern1,enable=pattern2

is a confusing way to say

    -trace enable=pattern2

To specify both patterns, use

    -trace enable=pattern1 -trace enable=pattern2

Lovely, isn't it?


