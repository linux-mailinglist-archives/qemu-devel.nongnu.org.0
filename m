Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91EA3BBDDC
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:52:13 +0200 (CEST)
Received: from localhost ([::1]:59504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0P15-0008Bs-Mr
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1m0Ozp-0007Ue-OJ
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:50:49 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:33771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1m0Ozm-0007vB-C2
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:50:49 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 o17-20020a9d76510000b02903eabfc221a9so18438960otl.0
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7omBBRF3CRauteEeU4dX2AZu8nNi2r6Tg1LnKaNwL+A=;
 b=M7yj1K1sdmKBCnHgYsikdbXR4IVln7PFzq1LT8ZnEYTPDoEFWXYhb5BhV/2D7RbBLS
 SI0JLLty6PkZ5sjueEkx+4WamR9xdfHZZwS6O8NzualqP0ARTsq67iAqWnQC7znVxWGx
 tw7qTryhKNGx8ekbdql+nHVdR6PPHQLxg2cXP/udjgK42gh9d5kFV+r1zaLZgjpQQ6MX
 09eQffGENiywGwo/SRce4meGarmCQ4N/XTlZSsvxZfZsfBD37ejDMAsdSqAy+X+JUjUS
 gZB4cpEVRK2Yof0XjDHLKrCykyWM+/LjGVfMmPWnqZnSTqfhJPMsTmUjrgyaPE+emymj
 rr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7omBBRF3CRauteEeU4dX2AZu8nNi2r6Tg1LnKaNwL+A=;
 b=MSij8CPTr4uoUZlTR0whdMvf5E7QFnrRjhRBuKLA7ES2RCOGO9hXPSIGslpIWK+QDj
 a3G0QKVrePRzceVsIlZ9blpu05WlE6aV3uaxObj7dBxKVhQ9vsur8W/CfnG7SQbGjMC5
 4q93CTdkU3jz22GgwUx0ff8JslD3b40GmH8w6UNtHCgo3F6qtemCNYVhsOeZVc0rYXPW
 rOHbnR3eFIbV5diCO63OymQbu45Q/EWzHgXBNf8jfhXl/5ZTHdoLrCZvzljQ2LPJjWs9
 zHoabRNXVjMh2Tosc+WHUzIASGJ30JPW/AOq4QLnD+/axQ/an6NjcRDVhPMuqhxDXUiF
 OwvQ==
X-Gm-Message-State: AOAM5305mNiCqYS3kj6YfPG3PwRZ1+g6JPsJunhTNL1yyuHbcOCaU4Xy
 +m8cBZ3t3/N71F7nsp2yZzupZy9gQq0GSPavNgm4UQ==
X-Google-Smtp-Source: ABdhPJzEUIXPY5HbALU6kfKHSe0BORyE3CGF4gB8XvK53CVXAWO96vJ3zvD2IR5jILaKvKVAmDGqu0aSOBTEJ6xPXew=
X-Received: by 2002:a9d:2923:: with SMTP id d32mr10776652otb.67.1625493044611; 
 Mon, 05 Jul 2021 06:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210609100457.142570-1-andrew@daynix.com>
 <20210609100457.142570-5-andrew@daynix.com>
 <87fsxnejnw.fsf@dusky.pond.sub.org>
 <CABcq3pHsSyk7d42Qb6k5ke1QxME1TArNkWB9LLzZq8f4UYmk4A@mail.gmail.com>
In-Reply-To: <CABcq3pHsSyk7d42Qb6k5ke1QxME1TArNkWB9LLzZq8f4UYmk4A@mail.gmail.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Mon, 5 Jul 2021 16:50:33 +0300
Message-ID: <CABcq3pFim4Ebk4U1XiTuKvUSTWAyT5Htm-3nRQt+JhiyCrcmZQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/5] qmp: Added qemu-ebpf-rss-path command.
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000825eb805c6609739"
Received-SPF: none client-ip=2607:f8b0:4864:20::329;
 envelope-from=andrew@daynix.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000825eb805c6609739
Content-Type: text/plain; charset="UTF-8"

Hi all,
I'm working right now with the helper stamping.
In short - we can't check the helper stamp as it was done in qemu with
modules.
Gmodule can't load ELF executable also gmodule is not present if qemu
module feature is not set.
Also, CONFIG_STAMP is not present if there is no module feature.
There are some possible solutions:

   - Try to load ELF executable with ld.so and check the stamp symbol.
   - Launch potential helper with an argument(something like --get-stamp)
   and check the output.
   - Write ELF parser to check symbols table.

Also, add a stamp for helpers(something like QEMU_HELPER_STAMP) so the
helper should not be dependent on qemu module feature.
I think is more preferable to write ELF parser and also it should be more
secure(no .so constructors or launching unknown helper).
What do you think people?

On Wed, Jun 16, 2021 at 2:16 AM Andrew Melnichenko <andrew@daynix.com>
wrote:

> Hi all,
>
>> Seems like this function is duplicating what glib should already be
>> able to do.
>>
> Yea, but it's required a Linux specific header - without it, qemu builds
> but crashes.
>
> Could we use a compile-time determination of where we were (supposed)
>> to be installed, and therefore where our helper should be installed,
>> rather than the dynamic /proc/self/exe munging?
>>
> Yes, we can define something like CONFIG_QEMU_HELPERDIR ##
> "qemu-ebpf-rss-helper", for RSS helper.
> But I've tried to implement generic function for possible other helpers.
>
> Yeah I think avoiding /proc/self/exe is desirable, because I can
>> imagine scenarios where this can lead to picking the wrong helper.
>> Better to always use the compile time install directory.
>>
> The main scenario that find_helper() should solve - non installed qemu use
> helper from own build.
> That's why reading /proc/self/exe is implemented.
>
> So the intent is that we can make this list larger if we write other
>> helper binaries.  But this code is in an overall #ifdef CONFIG_LINUX,
>> which means it won't work on other platforms.
>>
> Yes, for now, eBPF RSS is only for virtio-net + Linux TAP.
>
> Checking F_OK (existence) instea of X_OK is odd.
>>
> Libvirt launches qemu to get different properties. That qemu may not have
> permission to launch the helper.
>
> It uses /proc/self/exe to find the running executable's directory.  This
>> is specific to Linux[*].  You get different behavior on Linux vs. other
>> systems.
>>
> The code guarded by CONFIG_LINUX.
>
> * If the host isn't Linux, it returns /usr/libexec/qemu-ebpf-rss-helper.
>>   Not good.
>>
> No,  "query-helper-paths" will return an empty list.
>
> * If Alice runs bld/x86_64-softmmu/qemu-system-x86_64, it also returns
>>   /usr/libexec/qemu-ebpf-rss-helper.  Not good.
>>
> No, /proc/self/exe dereferences "bld/x86_64-softmmu/qemu-system-x86_64"
> to "bld/qemu-system-x86_64"
> and we will get bld/qemu-ebpf-rss-helper.
>
>  The name query-helper-paths is generic, the documented purpose "Query
>> specific eBPF RSS helper" is specific.
>>
>> qemu-ebpf-rss-helper isn't necessarily the only helper that needs to be
>> in sync with QEMU.
>>
> Yea, I'll update the document.
>
> If we want to ensure the right helper runs, we should use a build
>> identifier compiled into the programs, like we do for modules.
>>
> Thanks, I'll check. Overall, current idea was to avoid the use of the
> helper
> from CONFIG_QEMU_HELPERDIR if qemu is not installed(like in your examples).
>
> Helpers QEMU code runs itself should be run as
>> CONFIG_QEMU_HELPERDIR/HELPER, with a suitable user override.  This is
>> how qemu-bridge-helper works.
>>
>> Helpers some other program runs are that other program's problem.
>> They'll probably work the same: built-in default that can be overridden
>> with configuration.
>>
> Well, for qemu it does not really matter how TAP fd was created. It can be
> the helper, Libvirt itself, or a script.
> In the end, "netdev" gets its fds and for qemu there is no difference. TAP
> fd is TAP fd.
> And Libvirt would use the same qemu-bridge-helper(from libvirt/qemu.conf)
> for every qemu "emulator".
> For eBPF we need to create specific maps(and/or thair quantities) that
> contain specific structures and for different
> qemu it may be different.
>
>
>
> On Sat, Jun 12, 2021 at 8:28 AM Markus Armbruster <armbru@redhat.com>
> wrote:
>
>> Andrew Melnychenko <andrew@daynix.com> writes:
>>
>> > New qmp command to query ebpf helper.
>> > It's crucial that qemu and helper are in sync and in touch.
>> > Technically helper should pass eBPF fds that qemu may accept.
>> > And different qemu's builds may have different eBPF programs and
>> helpers.
>> > Qemu returns helper that should "fit" to virtio-net.
>> >
>> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
>> > ---
>> >  monitor/qmp-cmds.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
>> >  qapi/misc.json     | 29 +++++++++++++++++
>> >  2 files changed, 107 insertions(+)
>> >
>> > diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
>> > index f7d64a6457..5dd2a58ea2 100644
>> > --- a/monitor/qmp-cmds.c
>> > +++ b/monitor/qmp-cmds.c
>> > @@ -351,3 +351,81 @@ void qmp_display_reload(DisplayReloadOptions *arg,
>> Error **errp)
>> >          abort();
>> >      }
>> >  }
>> > +
>> > +#ifdef CONFIG_LINUX
>> > +
>> > +static const char *get_dirname(char *path)
>> > +{
>> > +    char *sep;
>> > +
>> > +    sep = strrchr(path, '/');
>> > +    if (sep == path) {
>> > +        return "/";
>> > +    } else if (sep) {
>> > +        *sep = 0;
>> > +        return path;
>> > +    }
>> > +    return ".";
>> > +}
>> > +
>> > +static char *find_helper(const char *name)
>> > +{
>> > +    char qemu_exec[PATH_MAX];
>> > +    const char *qemu_dir = NULL;
>> > +    char *helper = NULL;
>> > +
>> > +    if (name == NULL) {
>> > +        return NULL;
>> > +    }
>> > +
>> > +    if (readlink("/proc/self/exe", qemu_exec, PATH_MAX) > 0) {
>> > +        qemu_dir = get_dirname(qemu_exec);
>> > +
>> > +        helper = g_strdup_printf("%s/%s", qemu_dir, name);
>> > +        if (access(helper, F_OK) == 0) {
>> > +            return helper;
>> > +        }
>> > +        g_free(helper);
>> > +    }
>> > +
>> > +    helper = g_strdup_printf("%s/%s", CONFIG_QEMU_HELPERDIR, name);
>> > +    if (access(helper, F_OK) == 0) {
>> > +        return helper;
>> > +    }
>> > +    g_free(helper);
>> > +
>> > +    return NULL;
>> > +}
>>
>> This returns the helper in the same directory as the running executable,
>> or as a fallback the helper in CONFIG_QEMU_HELPERDIR.
>>
>> Checking F_OK (existence) instea of X_OK is odd.
>>
>> It uses /proc/self/exe to find the running executable's directory.  This
>> is specific to Linux[*].  You get different behavior on Linux vs. other
>> systems.
>>
>> CONFIG_QEMU_HELPERDIR is $prefix/libexec/.
>>
>> If $prefix is /usr, then qemu-system-FOO is normally installed in
>> /usr/bin/, and the helper in /usr/libexec/.  We look for the helper in
>> the wrong place first, and the right one only when it isn't in the wrong
>> place.  Feels overcomplicated and fragile.
>>
>> Consider the following scenario:
>>
>> * The system has a binary package's /usr/bin/qemu-system-x86_64 and
>>   /usr/libexec/qemu-ebpf-rss-helper installed
>>
>> * Alice builds her own QEMU with prefix /usr (and no intention to
>>   install), resulting in bld/qemu-system-x86_64, bld/qemu-ebpf-rss-path,
>>   and a symlink bld/x86_64-softmmu/qemu-system-x86_64.
>>
>> Now:
>>
>> * If Alice runs bld/qemu-system-x86_64, and the host is Linux,
>>   find_helper() returns bld/qemu-ebpf-rss-path.  Good.
>>
>> * If the host isn't Linux, it returns /usr/libexec/qemu-ebpf-rss-helper.
>>   Not good.
>>
>> * If Alice runs bld/x86_64-softmmu/qemu-system-x86_64, it also returns
>>   /usr/libexec/qemu-ebpf-rss-helper.  Not good.
>>
>> > +
>> > +HelperPathList *qmp_query_helper_paths(Error **errp)
>> > +{
>> > +    HelperPathList *ret = NULL;
>> > +    const char *helpers_list[] = {
>> > +#ifdef CONFIG_EBPF
>> > +        "qemu-ebpf-rss-helper",
>> > +#endif
>> > +        NULL
>> > +    };
>> > +    const char **helper_iter = helpers_list;
>> > +
>> > +    for (; *helper_iter != NULL; ++helper_iter) {
>> > +        char *path = find_helper(*helper_iter);
>> > +        if (path) {
>> > +            HelperPath *helper = g_new0(HelperPath, 1);
>> > +            helper->name = g_strdup(*helper_iter);
>> > +            helper->path = path;
>> > +
>> > +            QAPI_LIST_PREPEND(ret, helper);
>> > +        }
>> > +    }
>> > +
>> > +    return ret;
>> > +}
>> > +#else
>> > +
>> > +HelperPathList *qmp_query_helper_paths(Error **errp)
>> > +{
>> > +    return NULL;
>> > +}
>> > +
>> > +#endif
>> > diff --git a/qapi/misc.json b/qapi/misc.json
>> > index 156f98203e..023bd2120d 100644
>> > --- a/qapi/misc.json
>> > +++ b/qapi/misc.json
>> > @@ -519,3 +519,32 @@
>> >   'data': { '*option': 'str' },
>> >   'returns': ['CommandLineOptionInfo'],
>> >   'allow-preconfig': true }
>> > +
>> > +##
>> > +# @HelperPath:
>> > +#
>> > +# Name of the helper and binary location.
>> > +##
>> > +{ 'struct': 'HelperPath',
>> > +  'data': {'name': 'str', 'path': 'str'} }
>> > +
>> > +##
>> > +# @query-helper-paths:
>> > +#
>> > +# Query specific eBPF RSS helper for current qemu binary.
>> > +#
>> > +# Returns: list of object that contains name and path for helper.
>> > +#
>> > +# Example:
>> > +#
>> > +# -> { "execute": "query-helper-paths" }
>> > +# <- { "return": [
>> > +#        {
>> > +#          "name": "qemu-ebpf-rss-helper",
>> > +#          "path": "/usr/local/libexec/qemu-ebpf-rss-helper"
>> > +#        }
>> > +#      ]
>> > +#    }
>> > +#
>> > +##
>> > +{ 'command': 'query-helper-paths', 'returns': ['HelperPath'] }
>>
>> The name query-helper-paths is generic, the documented purpose "Query
>> specific eBPF RSS helper" is specific.
>>
>> qemu-ebpf-rss-helper isn't necessarily the only helper that needs to be
>> in sync with QEMU.
>>
>> I doubt a query command is a good way to help with using the right one.
>> qemu-system-FOO doesn't really know where the right one is.  Only the
>> person or program that put them where they are does.
>>
>> If we want to ensure the right helper runs, we should use a build
>> identifier compiled into the programs, like we do for modules.
>>
>> For modules, the program loading a module checks the module's build
>> identifier matches its own.
>>
>> For programs talking to each other, the peers together check their build
>> identifiers match.
>>
>> For programs where that isn't practical, the management application can
>> check.
>>
>> This should be a lot more reliable.
>>
>> Helpers QEMU code runs itself should be run as
>> CONFIG_QEMU_HELPERDIR/HELPER, with a suitable user override.  This is
>> how qemu-bridge-helper works.
>>
>> Helpers some other program runs are that other program's problem.
>> They'll probably work the same: built-in default that can be overridden
>> with configuration.
>>
>>
>> [*] For detailed advice, see
>>
>> https://stackoverflow.com/questions/1023306/finding-current-executables-path-without-proc-self-exe
>>
>>

--000000000000825eb805c6609739
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div>I&#39;m working right now with the =
helper stamping.</div><div>In short - we can&#39;t check the helper stamp a=
s it was done in qemu with modules.</div><div>Gmodule can&#39;t load ELF ex=
ecutable also gmodule is not present if qemu module feature is not set.</di=
v><div>Also, CONFIG_STAMP is not present if there is no module feature.<br>=
</div><div>There are some possible solutions:</div><div><ul><li>Try to load=
 ELF executable with ld.so and check the stamp symbol.<br></li><li>Launch p=
otential helper with an argument(something like --get-stamp) and check the =
output.<br></li><li>Write ELF parser to check symbols table.</li></ul><div>=
Also, add a stamp for helpers(something like QEMU_HELPER_STAMP) so the help=
er should not be dependent on qemu module feature.<br><div></div><div>I thi=
nk is more preferable to write ELF parser and also it should be more secure=
(no .so constructors or launching unknown helper).</div><div>What do you th=
ink people?<br></div></div></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 16, 2021 at 2:16 AM Andrew Mel=
nichenko &lt;<a href=3D"mailto:andrew@daynix.com">andrew@daynix.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div>Hi all,</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div>Seems like this function is duplicating what glib should already be<=
br>
able to do.<span><br></span></div></blockquote><div>Yea, but it&#39;s requi=
red a Linux specific header - without it, qemu builds but crashes.</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>Could we=
 use a compile-time determination of where we were (supposed)<br>
to be installed, and therefore where our helper should be installed,<br>
rather than the dynamic /proc/self/exe munging?<span><br></span></div></blo=
ckquote><div><div>Yes, we can define something like CONFIG_QEMU_HELPERDIR #=
# &quot;qemu-ebpf-rss-helper&quot;, for RSS helper.</div><div>But I&#39;ve =
tried to implement generic function for possible other helpers.</div><div><=
br></div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>Yeah =
I think avoiding /proc/self/exe is desirable, because I can<br>
imagine scenarios where this can lead to picking the wrong helper.<br>
Better to always use the compile time install directory. <br></div></blockq=
uote><div>The main scenario that find_helper() should solve - non installed=
 qemu use helper from own build.</div><div>That&#39;s why reading /proc/sel=
f/exe is implemented.<br></div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div>So the intent is that we can make this list large=
r if we write other<br>
helper binaries.=C2=A0 But this code is in an overall #ifdef CONFIG_LINUX,<=
br>
which means it won&#39;t work on other platforms.</div></blockquote><div>Ye=
s, for now, eBPF RSS is only for virtio-net=C2=A0+ Linux TAP.</div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>Checking F_OK=
 (existence) instea of X_OK is odd.</div></blockquote><div>Libvirt launches=
 qemu to get different properties. That qemu may not have permission to lau=
nch the helper.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div>It uses /proc/self/exe to find the running executable&#39;s=
 directory.=C2=A0 This<br>
is specific to Linux[*].=C2=A0 You get different behavior on Linux vs. othe=
r<br>
systems.</div></blockquote><div>The code guarded by CONFIG_LINUX.</div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>* If the =
host isn&#39;t Linux, it returns /usr/libexec/qemu-ebpf-rss-helper.<br>
=C2=A0 Not good.</div></blockquote><div>No,=C2=A0 <span>&quot;query-helper-=
paths&quot; will return an empty list.</span></div><div><span><br></span></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div><span>* If Alice=
 runs bld/x86_64-softmmu/qemu-system-x86_64, it also returns<br>
=C2=A0 /usr/libexec/qemu-ebpf-rss-hel</span><span>per.=C2=A0 Not good.</spa=
n></div></blockquote><div>No, /proc/self/exe <span lang=3D"en"><span><span>=
dereferences &quot;bld/x86_64-softmmu/qemu-system-x86_64&quot; to &quot;bld=
/qemu-system-x86_64&quot;</span></span></span></div><div><span lang=3D"en">=
<span><span>and we will get bld/qemu-ebpf-rss-helper.</span></span></span><=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>=
=C2=A0The name query-helper-paths is generic, the documented purpose &quot;=
Query<br>
specific eBPF RSS helper&quot; is specific.<br>
<br>
qemu-ebpf-rss-helper isn&#39;t necessarily the only helper that needs to be=
<br>
in sync with QEMU.</div></blockquote><div>Yea, I&#39;ll update the document=
.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v>If we want to ensure the right helper runs, we should use a build<br>
identifier compiled into the programs, like we do for modules.</div></block=
quote><div><span lang=3D"en"><span><span>Thanks, I&#39;ll check. Overall, c=
urrent idea was to avoid the use of the helper<br></span></span></span></di=
v><div><span lang=3D"en"><span><span>from CONFIG_QEMU_HELPERDIR if qemu is =
not installed(like in your examples).<br></span></span></span></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>Helpers QEMU=
 code runs itself should be run as<br>
CONFIG_QEMU_HELPERDIR/HELPER, with a suitable user override.=C2=A0 This is<=
br>
how qemu-bridge-helper works.<br><br></div></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div>Helpers some other program runs are t=
hat other program&#39;s problem.<br>
They&#39;ll probably work the same: built-in default that can be overridden=
<br>
with configuration. <br></div></blockquote><div></div><div>Well, for qemu i=
t does not really matter how TAP fd was created. It can be the helper, Libv=
irt itself, or a script.</div><div> In the end, &quot;netdev&quot; gets its=
 fds and for qemu there is no difference. TAP fd is TAP fd.</div><div>And L=
ibvirt would use the same qemu-bridge-helper(from libvirt/qemu.conf) for ev=
ery qemu &quot;emulator&quot;.<br></div><div>For eBPF we need to create spe=
cific maps(and/or thair quantities) that contain specific structures and fo=
r different</div><div>qemu it may be different.<br></div><div>=C2=A0</div><=
/div><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sat, Jun 12, 2021 at 8:28 AM Markus Armbruster=
 &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank">armbru@redhat.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Andrew Melnychenko &lt;<a href=3D"mailto:andrew@daynix.com" target=3D"_bl=
ank">andrew@daynix.com</a>&gt; writes:<br>
<br>
&gt; New qmp command to query ebpf helper.<br>
&gt; It&#39;s crucial that qemu and helper are in sync and in touch.<br>
&gt; Technically helper should pass eBPF fds that qemu may accept.<br>
&gt; And different qemu&#39;s builds may have different eBPF programs and h=
elpers.<br>
&gt; Qemu returns helper that should &quot;fit&quot; to virtio-net.<br>
&gt;<br>
&gt; Signed-off-by: Andrew Melnychenko &lt;<a href=3D"mailto:andrew@daynix.=
com" target=3D"_blank">andrew@daynix.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 monitor/qmp-cmds.c | 78 ++++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 qapi/misc.json=C2=A0 =C2=A0 =C2=A0| 29 +++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 107 insertions(+)<br>
&gt;<br>
&gt; diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c<br>
&gt; index f7d64a6457..5dd2a58ea2 100644<br>
&gt; --- a/monitor/qmp-cmds.c<br>
&gt; +++ b/monitor/qmp-cmds.c<br>
&gt; @@ -351,3 +351,81 @@ void qmp_display_reload(DisplayReloadOptions *arg=
, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; +#ifdef CONFIG_LINUX<br>
&gt; +<br>
&gt; +static const char *get_dirname(char *path)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 char *sep;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sep =3D strrchr(path, &#39;/&#39;);<br>
&gt; +=C2=A0 =C2=A0 if (sep =3D=3D path) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;/&quot;;<br>
&gt; +=C2=A0 =C2=A0 } else if (sep) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sep =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return path;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return &quot;.&quot;;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static char *find_helper(const char *name)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 char qemu_exec[PATH_MAX];<br>
&gt; +=C2=A0 =C2=A0 const char *qemu_dir =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 char *helper =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (name =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (readlink(&quot;/proc/self/exe&quot;, qemu_exec, PAT=
H_MAX) &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_dir =3D get_dirname(qemu_exec);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 helper =3D g_strdup_printf(&quot;%s/%s&qu=
ot;, qemu_dir, name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (access(helper, F_OK) =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return helper;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(helper);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 helper =3D g_strdup_printf(&quot;%s/%s&quot;, CONFIG_QE=
MU_HELPERDIR, name);<br>
&gt; +=C2=A0 =C2=A0 if (access(helper, F_OK) =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return helper;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 g_free(helper);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return NULL;<br>
&gt; +}<br>
<br>
This returns the helper in the same directory as the running executable,<br=
>
or as a fallback the helper in CONFIG_QEMU_HELPERDIR.<br>
<br>
Checking F_OK (existence) instea of X_OK is odd.<br>
<br>
It uses /proc/self/exe to find the running executable&#39;s directory.=C2=
=A0 This<br>
is specific to Linux[*].=C2=A0 You get different behavior on Linux vs. othe=
r<br>
systems.<br>
<br>
CONFIG_QEMU_HELPERDIR is $prefix/libexec/.<br>
<br>
If $prefix is /usr, then qemu-system-FOO is normally installed in<br>
/usr/bin/, and the helper in /usr/libexec/.=C2=A0 We look for the helper in=
<br>
the wrong place first, and the right one only when it isn&#39;t in the wron=
g<br>
place.=C2=A0 Feels overcomplicated and fragile.<br>
<br>
Consider the following scenario:<br>
<br>
* The system has a binary package&#39;s /usr/bin/qemu-system-x86_64 and<br>
=C2=A0 /usr/libexec/qemu-ebpf-rss-helper installed<br>
<br>
* Alice builds her own QEMU with prefix /usr (and no intention to<br>
=C2=A0 install), resulting in bld/qemu-system-x86_64, bld/qemu-ebpf-rss-pat=
h,<br>
=C2=A0 and a symlink bld/x86_64-softmmu/qemu-system-x86_64.<br>
<br>
Now:<br>
<br>
* If Alice runs bld/qemu-system-x86_64, and the host is Linux,<br>
=C2=A0 find_helper() returns bld/qemu-ebpf-rss-path.=C2=A0 Good.<br>
<br>
* If the host isn&#39;t Linux, it returns /usr/libexec/qemu-ebpf-rss-helper=
.<br>
=C2=A0 Not good.<br>
<br>
* If Alice runs bld/x86_64-softmmu/qemu-system-x86_64, it also returns<br>
=C2=A0 /usr/libexec/qemu-ebpf-rss-helper.=C2=A0 Not good.<br>
<br>
&gt; +<br>
&gt; +HelperPathList *qmp_query_helper_paths(Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 HelperPathList *ret =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 const char *helpers_list[] =3D {<br>
&gt; +#ifdef CONFIG_EBPF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;qemu-ebpf-rss-helper&quot;,<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 const char **helper_iter =3D helpers_list;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (; *helper_iter !=3D NULL; ++helper_iter) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *path =3D find_helper(*helper_iter);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (path) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HelperPath *helper =3D g_ne=
w0(HelperPath, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 helper-&gt;name =3D g_strdu=
p(*helper_iter);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 helper-&gt;path =3D path;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(ret, help=
er);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; +}<br>
&gt; +#else<br>
&gt; +<br>
&gt; +HelperPathList *qmp_query_helper_paths(Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return NULL;<br>
&gt; +}<br>
&gt; +<br>
&gt; +#endif<br>
&gt; diff --git a/qapi/misc.json b/qapi/misc.json<br>
&gt; index 156f98203e..023bd2120d 100644<br>
&gt; --- a/qapi/misc.json<br>
&gt; +++ b/qapi/misc.json<br>
&gt; @@ -519,3 +519,32 @@<br>
&gt;=C2=A0 =C2=A0&#39;data&#39;: { &#39;*option&#39;: &#39;str&#39; },<br>
&gt;=C2=A0 =C2=A0&#39;returns&#39;: [&#39;CommandLineOptionInfo&#39;],<br>
&gt;=C2=A0 =C2=A0&#39;allow-preconfig&#39;: true }<br>
&gt; +<br>
&gt; +##<br>
&gt; +# @HelperPath:<br>
&gt; +#<br>
&gt; +# Name of the helper and binary location.<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;HelperPath&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {&#39;name&#39;: &#39;str&#39;, &#39;path&#39;=
: &#39;str&#39;} }<br>
&gt; +<br>
&gt; +##<br>
&gt; +# @query-helper-paths:<br>
&gt; +#<br>
&gt; +# Query specific eBPF RSS helper for current qemu binary.<br>
&gt; +#<br>
&gt; +# Returns: list of object that contains name and path for helper.<br>
&gt; +#<br>
&gt; +# Example:<br>
&gt; +#<br>
&gt; +# -&gt; { &quot;execute&quot;: &quot;query-helper-paths&quot; }<br>
&gt; +# &lt;- { &quot;return&quot;: [<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;qemu-ebpf=
-rss-helper&quot;,<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;/usr/loca=
l/libexec/qemu-ebpf-rss-helper&quot;<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 ]<br>
&gt; +#=C2=A0 =C2=A0 }<br>
&gt; +#<br>
&gt; +##<br>
&gt; +{ &#39;command&#39;: &#39;query-helper-paths&#39;, &#39;returns&#39;:=
 [&#39;HelperPath&#39;] }<br>
<br>
The name query-helper-paths is generic, the documented purpose &quot;Query<=
br>
specific eBPF RSS helper&quot; is specific.<br>
<br>
qemu-ebpf-rss-helper isn&#39;t necessarily the only helper that needs to be=
<br>
in sync with QEMU.<br>
<br>
I doubt a query command is a good way to help with using the right one.<br>
qemu-system-FOO doesn&#39;t really know where the right one is.=C2=A0 Only =
the<br>
person or program that put them where they are does.<br>
<br>
If we want to ensure the right helper runs, we should use a build<br>
identifier compiled into the programs, like we do for modules.<br>
<br>
For modules, the program loading a module checks the module&#39;s build<br>
identifier matches its own.<br>
<br>
For programs talking to each other, the peers together check their build<br=
>
identifiers match.<br>
<br>
For programs where that isn&#39;t practical, the management application can=
<br>
check.<br>
<br>
This should be a lot more reliable.<br>
<br>
Helpers QEMU code runs itself should be run as<br>
CONFIG_QEMU_HELPERDIR/HELPER, with a suitable user override.=C2=A0 This is<=
br>
how qemu-bridge-helper works.<br>
<br>
Helpers some other program runs are that other program&#39;s problem.<br>
They&#39;ll probably work the same: built-in default that can be overridden=
<br>
with configuration.<br>
<br>
<br>
[*] For detailed advice, see<br>
<a href=3D"https://stackoverflow.com/questions/1023306/finding-current-exec=
utables-path-without-proc-self-exe" rel=3D"noreferrer" target=3D"_blank">ht=
tps://stackoverflow.com/questions/1023306/finding-current-executables-path-=
without-proc-self-exe</a><br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000825eb805c6609739--

