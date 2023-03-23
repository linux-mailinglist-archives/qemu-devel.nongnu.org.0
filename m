Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844796C5B4B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 01:17:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf8cb-0006dD-Gr; Wed, 22 Mar 2023 20:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pf8cZ-0006d2-1H
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 20:15:59 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pf8cT-0002kD-9O
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 20:15:58 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 178485C016A;
 Wed, 22 Mar 2023 20:15:49 -0400 (EDT)
Received: from imap42 ([10.202.2.92])
 by compute1.internal (MEProxy); Wed, 22 Mar 2023 20:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1679530549; x=1679616949; bh=2WBhlct6Z4f7YdCaayeDQQY3387Y0JOn7O9
 hxi+cS9E=; b=Bovt4lwJbd1Y03nsTYr6PvqXTDmdNlcYXKq64PbLouVOpWL3E7E
 we2JYYYjp4mFsQDVvI7s4dRiAySqxCKAIFW471bslnoGeBAqTiMPR1kVfMKP9NQx
 OetzhaczGsrozaoyKRWzSVrTdIwKw3MdrBt/AFcypoLKDpFEy63Q42qe6OYADqxn
 VD4ynI9oPCTkOC41MtVEx+A2XEYt4N+WWih8eogE4E2YCkPq1rG2sF6/MZHHl9CT
 CfTx885hsEalH2p0TvD08qk+nNJupLiL821VdXVyT5Bilvm+AeJ92eB9liMqOJCV
 DnPyt1hFzYD4VkdKb3oEYySzRrHIJVo4uLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1679530549; x=1679616949; bh=2WBhlct6Z4f7YdCaayeDQQY3387Y0JOn7O9
 hxi+cS9E=; b=O+TiSPJrR7qybl6L3J86FKLMeXs7DGaPMt4g2aS2j3B1S+UM2sd
 B+3rm7Z9aOJwnEDmpxzCarsLoJcukW7PiAdoNG5DksuXRiGqdiCrTN8VrG1sATZA
 Qy3YqKM53KMWN8egSoEMfLHthW3GLrZ7Zw12t07nt3+EjInEqrkTpnpMUoZvhaTI
 2a466WlMQgXMVErvH27riHzBgAP8oI/K88GTajizpvCb/0ieXKgHSqjR0Ubd6RmP
 0p2QFnYVihSn8x/X5yaonH2YR4BE0+ja/aga4MiUkfuVHzZ9DX3bSP/sGWN9ix+p
 pmQeeLzFhnXPwSXb7E5fBjRIlLKsTQ5L3AA==
X-ME-Sender: <xms:NJobZDTQvuAhcuNVXLVxD5j2cnyvK3B3S8FrLXc7IbT5m2xB0pfhQw>
 <xme:NJobZEx6M3C-wpvoN7rZ3CMMeeUcCXORFJwJD_wrGjMjErbfRstpCjUhdKIjk_ewX
 gcUpOm35ul5Pc0Z9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegfedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqher
 tderreejnecuhfhrohhmpedfffgrnhhivghlucgiuhdfuceougiguhesugiguhhuuhdrgi
 ihiieqnecuggftrfgrthhtvghrnhepveehudetfedvtdfhvdfgheejjedthfeiiefggffg
 uddvffdtveeljeelleefieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:NJobZI2yO6OcrO4haZ3VClgEvtNGot-YmSZSx1SJf92S0DLup1Yh2w>
 <xmx:NJobZDAgtUdMHhtGFYbcGq9GXFQ5pxqSMAAtUaF9wETX1JRq61NXIQ>
 <xmx:NJobZMiYjctYjEdz4VVG-ZR3_RiVr81eTlT1IV3vTxK2j04lWEbpxQ>
 <xmx:NZobZPv21zhLWtzLl_wnE772T5rLSbOZyTHJBYFviGBomahKbOeDBw>
Feedback-ID: i6a694271:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C6A9EBC0078; Wed, 22 Mar 2023 20:15:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-236-g06c0f70e43-fm-20230313.001-g06c0f70e
Mime-Version: 1.0
Message-Id: <569dc0e7-cce9-475c-8ea4-9a8786da54bc@app.fastmail.com>
In-Reply-To: <ZAr3VuuP7s0ka0rt@redhat.com>
References: <cover.1678401400.git.dxu@dxuuu.xyz>
 <c73263127c3533c9da06042a57bed2f334c5ea2e.1678401400.git.dxu@dxuuu.xyz>
 <ZAr3VuuP7s0ka0rt@redhat.com>
Date: Wed, 22 Mar 2023 18:15:25 -0600
From: "Daniel Xu" <dxu@dxuuu.xyz>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: michael.roth@amd.com, kkostiuk@redhat.com,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 2/3] qga: Add `merged` variant to
 GuestExecCaptureOutputMode
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.29; envelope-from=dxu@dxuuu.xyz;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Daniel,

Sorry about the delay -- was out of town the past week.

On Fri, Mar 10, 2023, at 2:24 AM, Daniel P. Berrang=C3=A9 wrote:
> On Thu, Mar 09, 2023 at 03:40:57PM -0700, Daniel Xu wrote:
>> Currently, any captured output (via `capture-output`) is segregated i=
nto
>> separate GuestExecStatus fields (`out-data` and `err-data`). This mea=
ns
>> that downstream consumers have no way to reassemble the captured data
>> back into the original stream.
>>=20
>> This is relevant for chatty and semi-interactive (ie. read only) CLI
>> tools.  Such tools may deliberately interleave stdout and stderr for
>> visual effect. If segregated, the output becomes harder to visually
>> understand.
>>=20
>> This commit adds a new enum variant to the GuestExecCaptureOutputMode
>> qapi to merge the output streams such that consumers can have a prist=
ine
>> view of the original command output.
>>=20
>> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
>> ---
>>  qga/commands.c       | 31 +++++++++++++++++++++++++++++--
>>  qga/qapi-schema.json |  4 +++-
>>  2 files changed, 32 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/qga/commands.c b/qga/commands.c
>> index 01f68b45ab..c347d434ed 100644
>> --- a/qga/commands.c
>> +++ b/qga/commands.c
>> @@ -270,12 +270,26 @@ static void guest_exec_child_watch(GPid pid, gi=
nt status, gpointer data)
>>      g_spawn_close_pid(pid);
>>  }
>> =20
>> -/** Reset ignored signals back to default. */
>>  static void guest_exec_task_setup(gpointer data)
>>  {
>>  #if !defined(G_OS_WIN32)
>> +    bool has_merge =3D *(bool *)data;
>>      struct sigaction sigact;
>> =20
>> +    if (has_merge) {
>> +        /*
>> +         * FIXME: When `GLIB_VERSION_MIN_REQUIRED` is bumped to 2.58=
+, use
>> +         * g_spawn_async_with_fds() to be portable on windows. The c=
urrent
>> +         * logic does not work on windows b/c `GSpawnChildSetupFunc`=
 is run
>> +         * inside the parent, not the child.
>> +         */
>> +        if (dup2(STDOUT_FILENO, STDERR_FILENO) !=3D 0) {
>> +            slog("dup2() failed to merge stderr into stdout: %s",
>> +                 strerror(errno));
>> +        }
>> +    }
>> +
>> +    /* Reset ignored signals back to default. */
>>      memset(&sigact, 0, sizeof(struct sigaction));
>>      sigact.sa_handler =3D SIG_DFL;
>> =20
>> @@ -409,6 +423,7 @@ GuestExec *qmp_guest_exec(const char *path,
>>      GIOChannel *in_ch, *out_ch, *err_ch;
>>      GSpawnFlags flags;
>>      bool has_output =3D false;
>> +    bool has_merge =3D false;
>
> Wrap in  #ifndef _WIN32

I think it would be better to leave this variable un-gated b/c gating it
would make the later call to g_spawn_async_with_pipes() less clean.
I don't think it'll trigger any unused variable warnings either since we
are technically always using it.

>
>>      GuestExecCaptureOutputMode output_mode;
>>      g_autofree uint8_t *input =3D NULL;
>>      size_t ninput =3D 0;
>> @@ -445,13 +460,25 @@ GuestExec *qmp_guest_exec(const char *path,
>>      case GUEST_EXEC_CAPTURE_OUTPUT_MODE_SEPARATED:
>>          has_output =3D true;
>>          break;
>> +    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_MERGED:
>> +        has_output =3D true;
>> +        has_merge =3D true;
>> +        break;
>
> Wrap in  #ifndef _WIN32
>
>>      case GUEST_EXEC_CAPTURE_OUTPUT_MODE__MAX:
>>          /* Silence warning; impossible branch */
>>          break;
>>      }
>> =20
>> +#if defined(G_OS_WIN32)
>> +    /* FIXME: see comment in guest_exec_task_setup() */
>> +    if (has_merge) {
>> +        error_setg(errp, "merged unsupported on windows");
>> +        return NULL;
>> +    }
>> +#endif
>
> THis can be dropped, since 'has_merge' won't exist for
> Win32 builds.
>
>> +
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
>> index d1e00a4234..b4782525ae 100644
>> --- a/qga/qapi-schema.json
>> +++ b/qga/qapi-schema.json
>> @@ -1210,11 +1210,13 @@
>>  # @stderr: only capture stderr
>>  # @separated: capture both stdout and stderr, but separated into
>>  #             GuestExecStatus out-data and err-data, respectively
>> +# @merged: capture both stdout and stderr, but merge together
>> +#          into out-data. not effective on windows guests.
>>  #
>>  # Since: 8.0
>>  ##
>>   { 'enum': 'GuestExecCaptureOutputMode',
>> -   'data': [ 'none', 'stdout', 'stderr', 'separated' ] }
>> +   'data': [ 'none', 'stdout', 'stderr', 'separated', 'merged' ] }
>
> Actually, I've just realized we can make this conditional:
>
>
>  'data': [ 'none', 'stdout', 'stderr', 'separated',
>            { 'name': 'merged', 'if': 'CONFIG_WIN32' } ] }
>
> so the constant doesn't even exist in Win32 builds.

Ack, that looks cleaner.

[...]

Thanks,
Daniel

