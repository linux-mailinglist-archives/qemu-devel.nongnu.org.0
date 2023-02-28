Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7066A5091
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 02:16:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWob4-0003lL-K6; Mon, 27 Feb 2023 20:16:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pWob1-0003ku-Sa
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 20:15:59 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pWoaz-0000Gd-RK
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 20:15:59 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0C3D85C01A8;
 Mon, 27 Feb 2023 20:15:57 -0500 (EST)
Received: from imap42 ([10.202.2.92])
 by compute1.internal (MEProxy); Mon, 27 Feb 2023 20:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1677546957; x=
 1677633357; bh=XKIMzndgKABcRAv6gRKx3CZ5TjUsBGjTEjIYmhMAPPs=; b=F
 A0nd7SgVYgZtEVSugJWU+GyEPva9jeBLyXLaKDNDbk2GrDgT+dQ7tcyP7K/QWlni
 TzhKLHeZp6u7wFsLnMS9xSbp2o93hRK150OqYbPOhJ+kpnTGP/4rIVZ7vCvQVxVU
 MXEWylK4FRIyZ11IBFnQNk5y9Hv9WM6jcb1zWQdSoyrwZT+Vc4bryKnifyJo0bLR
 uvG7j/Pd6T5vTWm0qp6cDrh/IZvxL7AGAyRwuSgFYZTaWkWJPj0f124S8X/Xa9pa
 dKQkWqEqX27Azcy7lTZUe8+9DVxuY0udY8eQUDJOgirJZaZCil5CRXpRpCCkUT+G
 Wgw6eYUZd6VKPJChUDi7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677546957; x=
 1677633357; bh=XKIMzndgKABcRAv6gRKx3CZ5TjUsBGjTEjIYmhMAPPs=; b=b
 QS9fKFh2Lx66QdTHGpAxbgi5Jcr4/mvvGiJYfcjEzkDSkQBJRK1ldFr3/bnV9Zvn
 0MQpiOXh+Hh4MNH0kNo0mD+987Kk738N4jQwsy9m7gBlgMxeZtxPP8Wv4BVss83i
 cYGn8JeKuWOrxNlUMXqL3On2wSizp4Vf2X3bOlhkM9Sw5NMJMrC+mnzi7aR9y0wj
 DjaV0TOD4uk1aUMp11z3YQw0GXNm+8/ou+bxcnLsowgt5KE7Qj3OFgjjGcft+nc8
 4TIpzqVtJOjCnAskZxTh2RNH4NIngEU5v75E1RVmKKVTmWaX44Jy3hcV92bGT1v8
 KX9xFv1Ql5ufjjsJhqJnA==
X-ME-Sender: <xms:zFX9Y_C-bVtDaLdfFhaCxKCzLRa-lsPT6IUalQhY0uidrYe8MgeTzg>
 <xme:zFX9Y1gIfPTgt08mOl6QTcgkcKDgksG0q-sk_XnqK7Dz4AytgkKhsEaGWT27xJ3Xn
 Rf1F4oazuyAI5zRaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeluddgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqher
 tderreejnecuhfhrohhmpedfffgrnhhivghlucgiuhdfuceougiguhesugiguhhuuhdrgi
 ihiieqnecuggftrfgrthhtvghrnhepheetiedvieehudejleffvedufeevgeekvefghedu
 gedtffejkedvgeeujedukeegnecuffhomhgrihhnpehgthhkrdhorhhgnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdr
 giihii
X-ME-Proxy: <xmx:zFX9Y6n1zoDm_PnW0zUpiz-xGT99XpQfZGwZNl459XtRdtg-yFwc1A>
 <xmx:zFX9YxzbgxPoy6d3eOlGeDlw6XMnw9FZ8Ovu9BLqs6DLF0nhVqlqWg>
 <xmx:zFX9Y0Q3E0he7KIPVUg9VXrh2jgOHiVtiabVWU-99UZ32Gmr_IuOKg>
 <xmx:zVX9Y96--8UZUButNLbCIg2OrdtNBGvv498MarKoPIfVGeD8bAJ1EQ>
Feedback-ID: i6a694271:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BC3ABBC0078; Mon, 27 Feb 2023 20:15:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-183-gbf7d00f500-fm-20230220.001-gbf7d00f5
Mime-Version: 1.0
Message-Id: <82c2bde8-9400-4289-9b6b-a9b6306fa362@app.fastmail.com>
In-Reply-To: <CAJ+F1CKa70J1cah7XnyCAtuUXJFCjmyau+BZpFWbyvR_jKTdBQ@mail.gmail.com>
References: <cover.1677197937.git.dxu@dxuuu.xyz>
 <6ed3091be8bc0ae8d3fee767b6e7400a8e32c493.1677197937.git.dxu@dxuuu.xyz>
 <CAJ+F1CKa70J1cah7XnyCAtuUXJFCjmyau+BZpFWbyvR_jKTdBQ@mail.gmail.com>
Date: Mon, 27 Feb 2023 18:15:35 -0700
From: "Daniel Xu" <dxu@dxuuu.xyz>
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
Cc: michael.roth@amd.com, kkostiuk@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/3] qga: Add optional `merge-output` flag to guest-exec
 qapi
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=66.111.4.27; envelope-from=dxu@dxuuu.xyz;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_NXDOMAIN=0.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, NO_DNS_FOR_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

Hi,

On Mon, Feb 27, 2023, at 1:22 AM, Marc-Andr=C3=A9 Lureau wrote:
> Hi
>
> On Fri, Feb 24, 2023 at 8:31 AM Daniel Xu <dxu@dxuuu.xyz> wrote:
>>
>> Currently, the captured output (via `capture-output`) is segregated i=
nto
>> separate GuestExecStatus fields (`out-data` and `err-data`). This mea=
ns
>> that downstream consumers have no way to reassemble the captured data
>> back into the original stream.
>>
>> This is relevant for chatty and semi-interactive (ie. read only) CLI
>> tools.  Such tools may deliberately interleave stdout and stderr for
>> visual effect. If segregated, the output becomes harder to visually
>> understand.
>>
>> This commit adds a new optional flag to the guest-exec qapi to merge =
the
>> output streams such that consumers can have a pristine view of the
>> original command output.
>>
>> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
>> ---
>>  qga/commands.c       | 13 ++++++++++++-
>>  qga/qapi-schema.json |  6 +++++-
>>  2 files changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/qga/commands.c b/qga/commands.c
>> index 360077364e..14b970e768 100644
>> --- a/qga/commands.c
>> +++ b/qga/commands.c
>> @@ -274,6 +274,15 @@ static void guest_exec_child_watch(GPid pid, gin=
t status, gpointer data)
>>  /** Reset ignored signals back to default. */
>>  static void guest_exec_task_setup(gpointer data)
>>  {
>> +    bool has_merge =3D *(bool *)data;
>> +
>> +    if (has_merge) {
>> +        if (dup2(STDOUT_FILENO, STDERR_FILENO) !=3D 0) {
>> +            slog("dup2() failed to merge stderr into stdout: %s",
>> +                 strerror(errno));
>> +        }
>> +    }
>
> https://docs.gtk.org/glib/callback.SpawnChildSetupFunc.html
>
> "On Windows, the function is called in the parent. Its usefulness on
> Windows is thus questionable. In many cases executing the child setup
> function in the parent can have ill effects, and you should be very
> careful when porting software to Windows that uses child setup
> functions."
>
> It looks like this would be bad.

Ah that's a good catch. I'm not very familiar with windows APIs so
unfortunately I don't have any good ideas here.

Best I can tell g_spawn_async_with_pipes_and_fds() work with it's
source_fds and target_fds mapping. But it looks like that came in
glib 2.68 so we cannot use it yet.

How about limiting this merge-output flag to linux/unix systems
for now? Could document this in the qapi doc string.

>
>> +
>>  #if !defined(G_OS_WIN32)
>>      struct sigaction sigact;
>>
>> @@ -385,6 +394,7 @@ GuestExec *qmp_guest_exec(const char *path,
>>                         bool has_env, strList *env,
>>                         const char *input_data,
>>                         bool has_capture_output, bool capture_output,
>> +                       bool has_merge_output, bool merge_output,
>>                         Error **errp)
>>  {
>>      GPid pid;
>> @@ -398,6 +408,7 @@ GuestExec *qmp_guest_exec(const char *path,
>>      GIOChannel *in_ch, *out_ch, *err_ch;
>>      GSpawnFlags flags;
>>      bool has_output =3D (has_capture_output && capture_output);
>> +    bool has_merge =3D (has_merge_output && merge_output);
>>      g_autofree uint8_t *input =3D NULL;
>>      size_t ninput =3D 0;
>>
>> @@ -421,7 +432,7 @@ GuestExec *qmp_guest_exec(const char *path,
>>      }
>>
>>      ret =3D g_spawn_async_with_pipes(NULL, argv, envp, flags,
>> -            guest_exec_task_setup, NULL, &pid, input_data ? &in_fd :=
 NULL,
>> +            guest_exec_task_setup, &has_merge, &pid, input_data ? &i=
n_fd : NULL,
>>              has_output ? &out_fd : NULL, has_output ? &err_fd : NULL=
, &gerr);
>>      if (!ret) {
>>          error_setg(errp, QERR_QGA_COMMAND_FAILED, gerr->message);
>> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
>> index 796434ed34..4192fcc5a4 100644
>> --- a/qga/qapi-schema.json
>> +++ b/qga/qapi-schema.json
>> @@ -1211,6 +1211,9 @@
>>  # @input-data: data to be passed to process stdin (base64 encoded)
>>  # @capture-output: bool flag to enable capture of
>>  #                  stdout/stderr of running process. defaults to fal=
se.
>> +# @merge-output: bool flag to merge stdout/stderr of running process
>> +#                into stdout. only effective if used with @capture-o=
utput.
>> +#                defaults to false.
>
> Add (since: 8.0)

Ack.

[...]

Thanks,
Daniel

