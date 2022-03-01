Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F02B4C8AD8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 12:33:30 +0100 (CET)
Received: from localhost ([::1]:45180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP0kz-0001km-95
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 06:33:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nP0hK-0008Sl-Kr
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 06:29:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nP0hI-0000GL-9S
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 06:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646134179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KoKsEmbKRNdb3GB+quHMrJte3m4mRGlce7uiCCXoW3w=;
 b=OOic1HbWkkCtoG1+K3cHHwg3tpckxce1/c3B/UV1x25mrqxKLyhCcFUglyfZ4RzPatRBhM
 gD/5UKhiNorne2/NFdhZIPPusgrr6EUo+AojDRFXVTO7cDJFA1BiyxafOe7BeOzpiVflsq
 te2x+t+VpPIoDCHt+zaeWsmUtLGPnE8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-M5jnSqP2Nz6FzWEkYJ9F9Q-1; Tue, 01 Mar 2022 06:29:38 -0500
X-MC-Unique: M5jnSqP2Nz6FzWEkYJ9F9Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 r206-20020a1c44d7000000b00380e36c6d34so843069wma.4
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 03:29:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=KoKsEmbKRNdb3GB+quHMrJte3m4mRGlce7uiCCXoW3w=;
 b=e4wJyJi+mcAz3e14PadbWghDW8dlzh3KVobif66Fxt1AdTRt3nm8r+NGsCTs14pegc
 foZXM+hTWcJKjCLElBcTkXUIT1l4vxW+AhdsqPCgP2lnX82n/Y5RbeMVK3S38nerntmG
 QCdbW6HiAumuvRNn0S8kGiyVet7cp/sS7gXgln0HVox9Ivs85kDqexKSVIo+P24sQfa5
 4+egemvmbhLT9l5ENTmAhybrDYwb5pIP2FThSP+7Z1N9aZQZgdXdwgWsAjBEhBU0lkAS
 NAwRWpOPSeNKh/LmLxbavqe4LgelkExpM1adVx8peral6q7QURtxgLkRFf1EMIa4YgJx
 Jmfg==
X-Gm-Message-State: AOAM531KPVDgQ3OQg6lo6II8fH89S/u6mViVfc049N7zU16mlolDCHJo
 wSAEIAZ1cVD+R8Z7HjzrHKBtcOFX6dO8mKmaaeIY0viwT3v8+asZX0v9Rx0XaZd1MAoORv8Ax9x
 bBlR9Sb5dxf3tM7g=
X-Received: by 2002:a05:600c:a03:b0:37b:daff:6146 with SMTP id
 z3-20020a05600c0a0300b0037bdaff6146mr16833971wmp.85.1646134176928; 
 Tue, 01 Mar 2022 03:29:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9AzYlIMLtBeN+8TXjXB55juvRMH2ZwIvB6w/YoJ44HZkNPDJw9XZ3YyfaayvrMr92Mr8a7w==
X-Received: by 2002:a05:600c:a03:b0:37b:daff:6146 with SMTP id
 z3-20020a05600c0a0300b0037bdaff6146mr16833945wmp.85.1646134176566; 
 Tue, 01 Mar 2022 03:29:36 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 k13-20020a05600c1c8d00b0038181dcd083sm2360337wms.36.2022.03.01.03.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 03:29:35 -0800 (PST)
Date: Tue, 1 Mar 2022 11:29:33 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH v9 3/3] qapi/monitor: allow VNC display id in
 set/expire_password
Message-ID: <Yh4DnamfMVzGQM8s@work-vm>
References: <20220225084949.35746-1-f.ebner@proxmox.com>
 <20220225084949.35746-4-f.ebner@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20220225084949.35746-4-f.ebner@proxmox.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: w.bumiller@proxmox.com, berrange@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, marcandre.lureau@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, eblake@redhat.com,
 t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Fabian Ebner (f.ebner@proxmox.com) wrote:
> From: Stefan Reiter <s.reiter@proxmox.com>
> 
> It is possible to specify more than one VNC server on the command line,
> either with an explicit ID or the auto-generated ones à la "default",
> "vnc2", "vnc3", ...
> 
> It is not possible to change the password on one of these extra VNC
> displays though. Fix this by adding a "display" parameter to the
> "set_password" and "expire_password" QMP and HMP commands.
> 
> For HMP, the display is specified using the "-d" value flag.
> 
> For QMP, the schema is updated to explicitly express the supported
> variants of the commands with protocol-discriminated unions.
> 
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> [FE: update "Since: " from 6.2 to 7.0
>      make @connected a common member of @SetPasswordOptions]
> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> 
> v8 -> v9:
> * Make @connected a common member of @SetPasswordOptions.
> * Use s rather than V to indicate that the flag takes a string value.
> 
>  hmp-commands.hx    | 24 ++++++------
>  monitor/hmp-cmds.c | 40 +++++++++++++------
>  monitor/qmp-cmds.c | 34 +++++++---------
>  qapi/ui.json       | 96 +++++++++++++++++++++++++++++++++++-----------
>  4 files changed, 129 insertions(+), 65 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 70a9136ac2..8476277aa9 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1514,33 +1514,35 @@ ERST
>  
>      {
>          .name       = "set_password",
> -        .args_type  = "protocol:s,password:s,connected:s?",
> -        .params     = "protocol password action-if-connected",
> +        .args_type  = "protocol:s,password:s,display:-ds,connected:s?",
> +        .params     = "protocol password [-d display] [action-if-connected]",
>          .help       = "set spice/vnc password",
>          .cmd        = hmp_set_password,
>      },
>  
>  SRST
> -``set_password [ vnc | spice ] password [ action-if-connected ]``
> -  Change spice/vnc password.  *action-if-connected* specifies what
> -  should happen in case a connection is established: *fail* makes the
> -  password change fail.  *disconnect* changes the password and
> +``set_password [ vnc | spice ] password [ -d display ] [ action-if-connected ]``
> +  Change spice/vnc password.  *display* can be used with 'vnc' to specify
> +  which display to set the password on.  *action-if-connected* specifies
> +  what should happen in case a connection is established: *fail* makes
> +  the password change fail.  *disconnect* changes the password and
>    disconnects the client.  *keep* changes the password and keeps the
>    connection up.  *keep* is the default.
>  ERST
>  
>      {
>          .name       = "expire_password",
> -        .args_type  = "protocol:s,time:s",
> -        .params     = "protocol time",
> +        .args_type  = "protocol:s,time:s,display:-ds",
> +        .params     = "protocol time [-d display]",
>          .help       = "set spice/vnc password expire-time",
>          .cmd        = hmp_expire_password,
>      },
>  
>  SRST
> -``expire_password [ vnc | spice ]`` *expire-time*
> -  Specify when a password for spice/vnc becomes
> -  invalid. *expire-time* accepts:
> +``expire_password [ vnc | spice ] expire-time [ -d display ]``
> +  Specify when a password for spice/vnc becomes invalid.
> +  *display* behaves the same as in ``set_password``.
> +  *expire-time* accepts:
>  
>    ``now``
>      Invalidate password instantly.
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index ff78741b75..634968498b 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1396,24 +1396,33 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
>  {
>      const char *protocol  = qdict_get_str(qdict, "protocol");
>      const char *password  = qdict_get_str(qdict, "password");
> +    const char *display = qdict_get_try_str(qdict, "display");
>      const char *connected = qdict_get_try_str(qdict, "connected");
>      Error *err = NULL;
> -    DisplayProtocol proto;
> -    SetPasswordAction conn;
>  
> -    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> -                            DISPLAY_PROTOCOL_VNC, &err);
> +    SetPasswordOptions opts = {
> +        .password = (char *)password,
> +        .has_connected = !!connected,
> +    };
> +
> +    opts.connected = qapi_enum_parse(&SetPasswordAction_lookup, connected,
> +                                     SET_PASSWORD_ACTION_KEEP, &err);
>      if (err) {
>          goto out;
>      }
>  
> -    conn = qapi_enum_parse(&SetPasswordAction_lookup, connected,
> -                           SET_PASSWORD_ACTION_KEEP, &err);
> +    opts.protocol = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> +                                    DISPLAY_PROTOCOL_VNC, &err);
>      if (err) {
>          goto out;
>      }
>  
> -    qmp_set_password(proto, password, !!connected, conn, &err);
> +    if (opts.protocol == DISPLAY_PROTOCOL_VNC) {
> +        opts.u.vnc.has_display = !!display;
> +        opts.u.vnc.display = (char *)display;
> +    }
> +
> +    qmp_set_password(&opts, &err);
>  
>  out:
>      hmp_handle_error(mon, err);
> @@ -1423,16 +1432,25 @@ void hmp_expire_password(Monitor *mon, const QDict *qdict)
>  {
>      const char *protocol  = qdict_get_str(qdict, "protocol");
>      const char *whenstr = qdict_get_str(qdict, "time");
> +    const char *display = qdict_get_try_str(qdict, "display");
>      Error *err = NULL;
> -    DisplayProtocol proto;
>  
> -    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> -                            DISPLAY_PROTOCOL_VNC, &err);
> +    ExpirePasswordOptions opts = {
> +        .time = (char *)whenstr,
> +    };
> +
> +    opts.protocol = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> +                                    DISPLAY_PROTOCOL_VNC, &err);
>      if (err) {
>          goto out;
>      }
>  
> -    qmp_expire_password(proto, whenstr, &err);
> +    if (opts.protocol == DISPLAY_PROTOCOL_VNC) {
> +        opts.u.vnc.has_display = !!display;
> +        opts.u.vnc.display = (char *)display;
> +    }
> +
> +    qmp_expire_password(&opts, &err);
>  
>  out:
>      hmp_handle_error(mon, err);
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index b6e8b57fcc..df97582dd4 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -168,35 +168,27 @@ void qmp_system_wakeup(Error **errp)
>      qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, errp);
>  }
>  
> -void qmp_set_password(DisplayProtocol protocol, const char *password,
> -                      bool has_connected, SetPasswordAction connected,
> -                      Error **errp)
> +void qmp_set_password(SetPasswordOptions *opts, Error **errp)
>  {
> -    int disconnect_if_connected = 0;
> -    int fail_if_connected = 0;
>      int rc;
>  
> -    if (has_connected) {
> -        fail_if_connected = connected == SET_PASSWORD_ACTION_FAIL;
> -        disconnect_if_connected = connected == SET_PASSWORD_ACTION_DISCONNECT;
> -    }
> -
> -    if (protocol == DISPLAY_PROTOCOL_SPICE) {
> +    if (opts->protocol == DISPLAY_PROTOCOL_SPICE) {
>          if (!qemu_using_spice(errp)) {
>              return;
>          }
> -        rc = qemu_spice.set_passwd(password, fail_if_connected,
> -                                   disconnect_if_connected);
> +        rc = qemu_spice.set_passwd(opts->password,
> +                opts->connected == SET_PASSWORD_ACTION_FAIL,
> +                opts->connected == SET_PASSWORD_ACTION_DISCONNECT);
>      } else {
> -        assert(protocol == DISPLAY_PROTOCOL_VNC);
> -        if (fail_if_connected || disconnect_if_connected) {
> +        assert(opts->protocol == DISPLAY_PROTOCOL_VNC);
> +        if (opts->connected != SET_PASSWORD_ACTION_KEEP) {
>              /* vnc supports "connected=keep" only */
>              error_setg(errp, QERR_INVALID_PARAMETER, "connected");
>              return;
>          }
>          /* Note that setting an empty password will not disable login through
>           * this interface. */
> -        rc = vnc_display_password(NULL, password);
> +        rc = vnc_display_password(opts->u.vnc.display, opts->password);
>      }
>  
>      if (rc != 0) {
> @@ -204,11 +196,11 @@ void qmp_set_password(DisplayProtocol protocol, const char *password,
>      }
>  }
>  
> -void qmp_expire_password(DisplayProtocol protocol, const char *whenstr,
> -                         Error **errp)
> +void qmp_expire_password(ExpirePasswordOptions *opts, Error **errp)
>  {
>      time_t when;
>      int rc;
> +    const char *whenstr = opts->time;
>  
>      if (strcmp(whenstr, "now") == 0) {
>          when = 0;
> @@ -220,14 +212,14 @@ void qmp_expire_password(DisplayProtocol protocol, const char *whenstr,
>          when = strtoull(whenstr, NULL, 10);
>      }
>  
> -    if (protocol == DISPLAY_PROTOCOL_SPICE) {
> +    if (opts->protocol == DISPLAY_PROTOCOL_SPICE) {
>          if (!qemu_using_spice(errp)) {
>              return;
>          }
>          rc = qemu_spice.set_pw_expire(when);
>      } else {
> -        assert(protocol == DISPLAY_PROTOCOL_VNC);
> -        rc = vnc_display_pw_expire(NULL, when);
> +        assert(opts->protocol == DISPLAY_PROTOCOL_VNC);
> +        rc = vnc_display_pw_expire(opts->u.vnc.display, when);
>      }
>  
>      if (rc != 0) {
> diff --git a/qapi/ui.json b/qapi/ui.json
> index e112409211..4a13f883a3 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -38,20 +38,47 @@
>    'data': [ 'keep', 'fail', 'disconnect' ] }
>  
>  ##
> -# @set_password:
> +# @SetPasswordOptions:
>  #
> -# Sets the password of a remote display session.
> +# Options for set_password.
>  #
>  # @protocol: - 'vnc' to modify the VNC server password
>  #            - 'spice' to modify the Spice server password
>  #
>  # @password: the new password
>  #
> -# @connected: how to handle existing clients when changing the
> -#             password.  If nothing is specified, defaults to 'keep'
> -#             'fail' to fail the command if clients are connected
> -#             'disconnect' to disconnect existing clients
> -#             'keep' to maintain existing clients
> +# @connected: How to handle existing clients when changing the
> +#             password. If nothing is specified, defaults to 'keep'.
> +#             For VNC, only 'keep' is currently implemented.
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'union': 'SetPasswordOptions',
> +  'base': { 'protocol': 'DisplayProtocol',
> +            'password': 'str',
> +            '*connected': 'SetPasswordAction' },
> +  'discriminator': 'protocol',
> +  'data': { 'vnc': 'SetPasswordOptionsVnc' } }
> +
> +##
> +# @SetPasswordOptionsVnc:
> +#
> +# Options for set_password specific to the VNC procotol.
> +#
> +# @display: The id of the display where the password should be changed.
> +#           Defaults to the first.
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'struct': 'SetPasswordOptionsVnc',
> +  'data': { '*display': 'str' } }
> +
> +##
> +# @set_password:
> +#
> +# Set the password of a remote display server.
>  #
>  # Returns: - Nothing on success
>  #          - If Spice is not enabled, DeviceNotFound
> @@ -65,17 +92,15 @@
>  # <- { "return": {} }
>  #
>  ##
> -{ 'command': 'set_password',
> -  'data': { 'protocol': 'DisplayProtocol',
> -            'password': 'str',
> -            '*connected': 'SetPasswordAction' } }
> +{ 'command': 'set_password', 'boxed': true, 'data': 'SetPasswordOptions' }
>  
>  ##
> -# @expire_password:
> +# @ExpirePasswordOptions:
>  #
> -# Expire the password of a remote display server.
> +# General options for expire_password.
>  #
> -# @protocol: the name of the remote display protocol 'vnc' or 'spice'
> +# @protocol: - 'vnc' to modify the VNC server expiration
> +#            - 'spice' to modify the Spice server expiration
>  #
>  # @time: when to expire the password.
>  #
> @@ -84,16 +109,45 @@
>  #        - '+INT' where INT is the number of seconds from now (integer)
>  #        - 'INT' where INT is the absolute time in seconds
>  #
> -# Returns: - Nothing on success
> -#          - If @protocol is 'spice' and Spice is not active, DeviceNotFound
> -#
> -# Since: 0.14
> -#
>  # Notes: Time is relative to the server and currently there is no way to
>  #        coordinate server time with client time.  It is not recommended to
>  #        use the absolute time version of the @time parameter unless you're
>  #        sure you are on the same machine as the QEMU instance.
>  #
> +# Since: 7.0
> +#
> +##
> +{ 'union': 'ExpirePasswordOptions',
> +  'base': { 'protocol': 'DisplayProtocol',
> +            'time': 'str' },
> +  'discriminator': 'protocol',
> +  'data': { 'vnc': 'ExpirePasswordOptionsVnc' } }
> +
> +##
> +# @ExpirePasswordOptionsVnc:
> +#
> +# Options for expire_password specific to the VNC procotol.
> +#
> +# @display: The id of the display where the expiration should be changed.
> +#           Defaults to the first.
> +#
> +# Since: 7.0
> +#
> +##
> +
> +{ 'struct': 'ExpirePasswordOptionsVnc',
> +  'data': { '*display': 'str' } }
> +
> +##
> +# @expire_password:
> +#
> +# Expire the password of a remote display server.
> +#
> +# Returns: - Nothing on success
> +#          - If @protocol is 'spice' and Spice is not active, DeviceNotFound
> +#
> +# Since: 0.14
> +#
>  # Example:
>  #
>  # -> { "execute": "expire_password", "arguments": { "protocol": "vnc",
> @@ -101,9 +155,7 @@
>  # <- { "return": {} }
>  #
>  ##
> -{ 'command': 'expire_password',
> -  'data': { 'protocol': 'DisplayProtocol',
> -            'time': 'str' } }
> +{ 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOptions' }
>  
>  ##
>  # @screendump:
> -- 
> 2.30.2
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


