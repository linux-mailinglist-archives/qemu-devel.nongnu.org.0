Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C3737536E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 14:07:59 +0200 (CEST)
Received: from localhost ([::1]:40328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lecnO-0008UN-0e
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 08:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lecjA-0007HR-6x
 for qemu-devel@nongnu.org; Thu, 06 May 2021 08:03:36 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leciv-0001Wh-AJ
 for qemu-devel@nongnu.org; Thu, 06 May 2021 08:03:34 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v12so5320692wrq.6
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 05:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=/E19/f4W10q1K0tbHgl7Av6q5UOFJavyay5XguV57zU=;
 b=BpKXmdVDzpsa/PvSWtjXcvENTI2qMHI7fD3wS8KVgXWbAX1aPY/Og/Ib0DV63b8nZ5
 TORevcZlhRSrcYD+pCyfHP7HRZ7mACoDEPGNoHWudg284lNBu70kQSCT2G4cv0MqUYed
 0BWsmyoNgr7+mBaw6nN2b3TyS7PS4EWPp5ujFV640Kg6IgFetB4k1gej1FDyIaZSF9v7
 1GSkgSq/gCkmnZzOn/u/s7KLnE2ZcWk4d6Qbn9xXZL9iktSoQS8MIo/jQAVMgbjNJbmg
 5rXSG5A0ngIYnwJzKh9eb/euBsLULDJG2gTevPp4gS7aioaLSOmnDpyWpTp5FEbz4eGl
 djyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=/E19/f4W10q1K0tbHgl7Av6q5UOFJavyay5XguV57zU=;
 b=pXLFtlk+njCne2NHnx3yXRxextTrcfh4fdIFVcMxM0QJwwIVK3lkR7TpOCPElLxgEE
 B0tuDL5kBSvM9uV/gy+Q3VSDqp83qMKWMggzdtymvtIXto64eAPJdKH6gLDMpvI+ysQ5
 U06RDPrHDEy+61mWp0p9+tg/SB9i8aTWMNFga6I+rAjDAKaWdyooYGufpXHA015GOgWn
 R0tikSn5RsGSPJdTmR5k6IVs0UisLbBofJflJDTgU60qrAmukSGAtvtxmWf69TP6E8U6
 JTVycNiMoJBhAnwH9dKwJQ3NehqhLaAqM3vTobit4dInvYhPNih7kCH9WVRIPhXiwAC2
 inuw==
X-Gm-Message-State: AOAM530LLow40HJtQZdqJfTM1PbVdgnvCUZDy6hALPj+Ot8AMRj+zNqr
 muo3d9L9XsOo3UBmlA5W3b7+9A==
X-Google-Smtp-Source: ABdhPJyVo7P25kizNYctGG4UjVBu4AVhYkB3VGRDJJz12GQQSdFtI7OStlos5yUfT65Rwvio9euoAg==
X-Received: by 2002:a05:6000:1846:: with SMTP id
 c6mr4538802wri.129.1620302599339; 
 Thu, 06 May 2021 05:03:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d2sm3837979wrs.10.2021.05.06.05.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 05:03:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D04C91FF7E;
 Thu,  6 May 2021 13:03:03 +0100 (BST)
References: <20210505170055.1415360-1-philmd@redhat.com>
 <20210505170055.1415360-4-philmd@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 3/5] gdbstub: Use fixed-size array in GdbCmdParseEntry
 instead of pointer
Date: Thu, 06 May 2021 13:01:57 +0100
In-reply-to: <20210505170055.1415360-4-philmd@redhat.com>
Message-ID: <877dkcnk7c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Warner Losh <imp@bsdimp.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> GdbCmdParseEntry should have enough room with 20 chars for the command
> string, and 8 for the schema. Add the GDB_CMD_PARSE_ENTRY_CMD_SIZE and
> GDB_CMD_PARSE_ENTRY_SCHEMA_SIZE definitions.
>
> Do not use pointer to string of unknown length, but array of fixed
> size. Having constant size will help use to remove the alloca() call
> in process_string_cmd() in the next commit.

I don't understand how this helps. The alloca is being used for an array
of GdbCmdVariant so why do we want to enlarge the size of the parse
table entries?

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  gdbstub.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index 6f663cbd8dd..0d5569ee539 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1457,11 +1457,13 @@ typedef void (*GdbCmdHandler)(GdbCmdContext *gdb_=
ctx, void *user_ctx);
>   * '.' -> Skip 1 char unless reached "\0"
>   * Any other value is treated as the delimiter value itself
>   */
> +#define GDB_CMD_PARSE_ENTRY_CMD_SIZE    20
> +#define GDB_CMD_PARSE_ENTRY_SCHEMA_SIZE 8
>  typedef struct GdbCmdParseEntry {
>      GdbCmdHandler handler;
> -    const char *cmd;
> +    const char cmd[GDB_CMD_PARSE_ENTRY_CMD_SIZE];
>      bool cmd_startswith;
> -    const char *schema;
> +    const char schema[GDB_CMD_PARSE_ENTRY_SCHEMA_SIZE];
>  } GdbCmdParseEntry;
>=20=20
>  static inline int startswith(const char *string, const char *pattern)
> @@ -1481,14 +1483,14 @@ static int process_string_cmd(void *user_ctx, con=
st char *data,
>=20=20
>      for (i =3D 0; i < num_cmds; i++) {
>          const GdbCmdParseEntry *cmd =3D &cmds[i];
> -        g_assert(cmd->handler && cmd->cmd);
> +        g_assert(cmd->handler && *cmd->cmd);
>=20=20
>          if ((cmd->cmd_startswith && !startswith(data, cmd->cmd)) ||
>              (!cmd->cmd_startswith && strcmp(cmd->cmd, data))) {
>              continue;
>          }
>=20=20
> -        if (cmd->schema) {
> +        if (*cmd->schema) {
>              schema_len =3D strlen(cmd->schema);
>              if (schema_len % 2) {
>                  return -2;


--=20
Alex Benn=C3=A9e

